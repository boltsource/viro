/**
 * Copyright © 2017 Viro Media. All rights reserved.
 */
package com.viromedia.bridge.component.node.control;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.common.MapBuilder;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.annotations.ReactProp;
import com.viromedia.bridge.component.node.VRTNodeManager;
import com.viromedia.bridge.utility.ViroEvents;

import java.util.Map;

public class VRTPolylineManager extends VRTControlManager<VRTPolyline> {

    public VRTPolylineManager(ReactApplicationContext context) {
        super(context);
    }

    @Override
    public String getName() {
        return "VRTPolyline";
    }

    @Override
    protected VRTPolyline createViewInstance(ThemedReactContext reactContext) {
        return new VRTPolyline(reactContext);
    }

    @ReactProp(name = "points")
    public void setPoints(VRTPolyline polyline, ReadableArray points) {
        polyline.setPoints(points);
    }

    @ReactProp(name = "closed", defaultBoolean = false)
    public void setClosed(VRTPolyline polyline, boolean closed) {
        polyline.setClosed(closed);
    }

    @ReactProp(name = "thickness", defaultFloat = 0.1f)
    public void setThickness(VRTPolyline polyline, float thickness) {
        polyline.setThickness(thickness);
    }

}
