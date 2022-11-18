//
//  ObjectScene.swift
//  Chapper
//
//  Created by renaka agusta on 19/10/22.
//

import Foundation
import SceneKit

struct ObjectScene {
    var title: String
    var objectName: String
    var description: String
    var hint: String
    var tag: String
    var type: ObjectType
    var narationDuration: CGFloat
    var taskDuration: CGFloat
    var tutorialDuration: CGFloat
    var narationSound : String
    var narationSoundExtention: String
    var soundEffect: String
    var soundEffectExtention: String
    var instructionList: [Instruction]?
}

struct Camera {
    var worldPosition: SCNVector3
    var worldOrientation: SCNQuaternion
}
