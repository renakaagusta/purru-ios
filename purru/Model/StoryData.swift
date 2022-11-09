//
//  StoryData.swift
//  Chapper
//
//  Created by renaka agusta on 19/10/22.
//

import Foundation

struct StoryData: Identifiable {
    var id: String
    var title: String
    var description: String
    var thumbnail: String
    var modalCover: String
    var sceneName: String
    var sceneExtension: String
    var particleTouch: String
    var particleEnding: String
    var backsound: String
    var backsoundExtention: String
    var skyBox: SkyBox
    var objectList: [ObjectScene]
    var isTutorial: Bool = false
}

struct StoryTab: Identifiable, Hashable {
    var id: String
    var title: String
    var description: String
    var thumbnail: String
    var modalCover: String
    var sceneName: String
    var sceneExtension: String
    var backsound: String
    var backsoundExtention: String
    var isTutorial: Bool = false
}
 
struct SkyBox {
    var px: String
    var py: String
    var pz: String
    var nx: String
    var ny: String
    var nz: String
}
 
