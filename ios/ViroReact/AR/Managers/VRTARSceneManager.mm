//
//  VRTARSceneManager.mm
//  ViroReact
//
//  Created by Andy Chu on 6/13/17.
//  Copyright © 2017 Viro Media. All rights reserved.
//


#import <React/RCTConvert.h>
#import <React/RCTUIManager.h>
#import <React/RCTBridge.h>

#import "VRTARSceneManager.h"
#import "VRTCamera.h"
#import "VRTARScene.h"
#import "VRTSceneShadowView.h"

@implementation VRTARSceneManager

RCT_EXPORT_MODULE()

RCT_EXPORT_VIEW_PROPERTY(displayPointCloud, BOOL)
RCT_EXPORT_VIEW_PROPERTY(pointCloudImage, RCTImageSource)
RCT_EXPORT_VIEW_PROPERTY(pointCloudScale, NSNumberArray)
RCT_EXPORT_VIEW_PROPERTY(pointCloudMaxPoints, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(anchorDetectionTypes, NSArray<NSString *>)
RCT_EXPORT_VIEW_PROPERTY(onHoverViro, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onClickViro, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onFuseViro, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onDragViro, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(timeToFuse, float)
RCT_EXPORT_VIEW_PROPERTY(canHover, BOOL)
RCT_EXPORT_VIEW_PROPERTY(canClick, BOOL)
RCT_EXPORT_VIEW_PROPERTY(canFuse, BOOL)
RCT_EXPORT_VIEW_PROPERTY(canDrag, BOOL)
RCT_EXPORT_VIEW_PROPERTY(onPinchViro, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onRotateViro, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onCameraARHitTestViro, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onARPointCloudUpdateViro, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(canPinch, BOOL)
RCT_EXPORT_VIEW_PROPERTY(canRotate, BOOL)
RCT_EXPORT_VIEW_PROPERTY(canCameraARHitTest, BOOL)
RCT_EXPORT_VIEW_PROPERTY(canARPointCloudUpdate, BOOL)
RCT_EXPORT_VIEW_PROPERTY(soundRoom, NSDictionary)
RCT_EXPORT_VIEW_PROPERTY(onPlatformUpdateViro, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onTrackingUpdatedViro, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onAmbientLightUpdateViro, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onAnchorFoundViro, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onAnchorUpdatedViro, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onAnchorRemovedViro, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(physicsWorld, NSDictionary)
RCT_EXPORT_VIEW_PROPERTY(postProcessEffects, NSArray<NSString *>)
RCT_EXPORT_VIEW_PROPERTY(ignoreEventHandling, BOOL)
RCT_EXPORT_VIEW_PROPERTY(dragType, NSString)
RCT_EXPORT_VIEW_PROPERTY(dragPlane, NSDictionary)
- (VRTView *)view
{
    return [[VRTARScene alloc] initWithBridge:self.bridge];
}

- (VRTSceneShadowView *)shadowView
{
    return [VRTSceneShadowView new];
}

@end
