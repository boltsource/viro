/**
 * Copyright (c) 2017-present, Viro Media, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */
import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View
} from 'react-native';

import {
  ViroARScene,
  ViroARPlane,
  ViroMaterials,
  ViroImage,
  ViroARPlaneSelector,
  ViroSurface,
  ViroConstants,
  ViroVideo,
  ViroText,
  ViroUtils
} from 'react-viro';

import TimerMixin from 'react-timer-mixin';

var createReactClass = require('create-react-class');

let polarToCartesian = ViroUtils.polarToCartesian;

var testARScene = createReactClass({
  mixins: [TimerMixin],
  getInitialState: function() {
    return {
      findPlanes : true,
      selectedState : "NOT Selected",
      numberOfPlanes : 2,
    }
  },
  render: function() {
    return (
      <ViroARScene anchorDetectionTypes={this.state.findPlanes ? "planes_horizontal" : "none"} >
        <ViroARPlaneSelector ref={"planeSelector"}
          maxPlanes={this.state.numberOfPlanes}
          onPlaneSelected={this._onPlaneSelected} >
          <ViroImage
            width={.2} height={.5}
            position={[0, .25, 0]}
            source={require("../res/ironman.png")}
            transformBehaviors="billboardY"
            onClick={this._onClick} />
        </ViroARPlaneSelector>

        <ViroText position={polarToCartesian([2, 0, 10])} text={"State: " + this.state.selectedState}
          style={styles.instructionText} transformBehaviors={["billboard"]}/>
        <ViroText position={polarToCartesian([2, 0, 0])} text={"MaxPlanes: " + this.state.numberOfPlanes}
          style={styles.instructionText} transformBehaviors={["billboard"]} onClick={this._numPlanesTextClick}/>
        <ViroText position={polarToCartesian([2, 0, -10])}
          text={this.state.findPlanes ? "Disable Plane Finding"  : "Enable Plane Finding"}
          onClick={()=>{this.setState({findPlanes : !this.state.findPlanes})}}
          style={styles.instructionText} transformBehaviors={["billboard"]}/>

        {/* Release Menu */}
        <ViroText position={polarToCartesian([2, -30, 0])} text={"Next test"}
          style={styles.instructionText} onClick={this._goToNextTest} transformBehaviors={["billboard"]}/>
        <ViroText position={polarToCartesian([2, -30, -15])} text={"Release Menu"}
          style={styles.instructionText} onClick={()=>{this.props.arSceneNavigator.replace("ARReleaseMenu", {scene: require("./ARReleaseMenu")})}}
          transformBehaviors={["billboard"]}/>
      </ViroARScene>
    );
  },
  _onPlaneSelected() {
    this.setState({
      selectedState : "Selected"
    })
  },
  _onClick() {
    this.refs["planeSelector"].reset();
    this.setState({
      selectedState : "NOT Selected"
    })
  },
  _numPlanesTextClick() {
    if (this.state.numberOfPlanes == 5) {
      this.setState({
        numberOfPlanes : 2
      })
    } else {
      this.setState({
        numberOfPlanes : this.state.numberOfPlanes + 1
      })
    }
  },
  _goToNextTest() {
    this.props.arSceneNavigator.replace("ARPlaneTest", {scene:require("./ARPlaneTest")})
  },
});

var styles = StyleSheet.create({
  instructionText: {
      fontFamily: 'Arial',
      fontSize: 10,
      color: '#cccccc',
      flex: 1,
      textAlignVertical: 'center',
      textAlign: 'center',
  },
});

module.exports = testARScene;
