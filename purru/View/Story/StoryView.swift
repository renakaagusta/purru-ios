//
//  StoryView.swift
//  Chapper
//
//  Created by renaka agusta on 17/10/22.

import SwiftUI
import SceneKit
import AVFoundation

enum DialogPosition {
    case Top, Bottom
}

struct StoryView: View {
    
    @ObservedObject var global = GlobalVariables.global
        
    private var gameView: GameView
    private var scene: SCNScene?
    private var view: SCNView
    private var cameraNode: SCNNode?
    private var cameraController: SCNCameraController?
    private var objectListNode: Array<SCNNode>?
    private var objectListPosition: Array<SCNVector3>?
    private var data: StoryData
    
    @State private var narationsProgress: CGFloat = 0
    @State private var state: StoryState = StoryState.Naration
    
    @State private var gestureVisibility = false
    @State private var gesture = ""
    @State private var endingVisibility: Bool = false
    
    @State private var hintVisibility = false
    
    @State private var dialogVisibility = false
    @State private var dialogView: AnyView = AnyView(VStack{})
    
    @State var pauseVisibility: Bool = false
    
    @State private var focusedObjectIndex = 0
    @State private var foundObject = 0
    
    @State private var elapsedTime: CGFloat = 0
    
    @State private var minFov: CGFloat = 20
    @State private var maxFov: CGFloat = 110
    
    @State private var objectHistoryList: [SCNNode] = []
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let cameraTimer = Timer.publish(every: 0, on: .main, in: .common).autoconnect()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    init(data: StoryData) {
        self.gameView = GameView()
        
        self.data = data
        
        print("===STORY DATA===")
        print(data.title)
        print(data.objectList.count)
        
        self.view = SCNView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        guard let sceneUrl = Bundle.main.url(forResource: data.sceneName, withExtension: data.sceneExtension) else { fatalError() }
        
        self.scene = try! SCNScene(url: sceneUrl, options: [.checkConsistency: true])
    
        //kanan, kiri, atas, bawah, belakang, depan
        
        self.scene?.background.contents = [
            UIImage(named: "px"),
            UIImage(named: "nx"),
            UIImage(named: "py"),
            UIImage(named: "ny"),
            UIImage(named: "pz"),
            UIImage(named: "nz")
        ]
        
    }
    
    func showHint() {
        if(data.objectList[focusedObjectIndex].type != ObjectType.Task) {
            return
        }
        
        let camera = self.view.defaultCameraController
        
        let cameraDestination = view.scene?.rootNode.childNodes.filter({$0.name == "CAM " + data.objectList[focusedObjectIndex].tag}).first
        
        self.view.defaultCameraController.pointOfView?.worldPosition = SCNVector3(x: cameraDestination?.worldPosition.x ?? 0, y: cameraDestination?.worldPosition.y ?? 0, z: cameraDestination?.worldPosition.z ?? 0)

        self.view.defaultCameraController.pointOfView?.worldOrientation =  SCNQuaternion(x: cameraDestination?.worldOrientation.x ?? 0, y: cameraDestination?.worldOrientation.y ?? 0, z: cameraDestination?.worldOrientation.z ?? 0, w: cameraDestination?.worldOrientation.w ?? 0)
                
        let objectTarget = view.scene!.rootNode.childNodes.filter({$0.name == data.objectList[focusedObjectIndex].tag}).first
        
        let material = objectTarget!.geometry!.firstMaterial!
        
        SCNTransaction.begin()
        SCNTransaction.animationDuration = 0.5
        
        SCNTransaction.completionBlock = {
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.5
            
            material.emission.contents = UIColor.black
            
            SCNTransaction.commit()
        }
        
        material.emission.contents = UIColor.yellow
        
        SCNTransaction.commit()

        hintVisibility = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            hintVisibility = false
        }
    }
    
    func handleTap(hitResults: [SCNHitTestResult]?) {
        if(hitResults == nil || state == StoryState.Naration) {
            return
        }
        
        if hitResults!.count > 0 {
            let result = hitResults![0]
            let material = result.node.geometry!.firstMaterial!
            
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.5
            
            SCNTransaction.completionBlock = {
                SCNTransaction.begin()
                SCNTransaction.animationDuration = 0.5
                
                material.emission.contents = UIColor.black
                
                SCNTransaction.commit()
            }
            
            material.emission.contents = UIColor.red
            
            SCNTransaction.commit()
            
            if(result.node.name == data.objectList[focusedObjectIndex].tag) {
                focusedObjectIndex = focusedObjectIndex + 1
                foundObject = foundObject + 1
                state = StoryState.Naration
                hintVisibility = false
                gestureVisibility = false
                elapsedTime = 0
    
                playNaration(soundName: data.objectList[focusedObjectIndex].narationSound, soundExtention: data.objectList[focusedObjectIndex].narationSoundExtention, currentTime: 0)
                
                material.normal.contents = nil
                material.diffuse.contents = nil
                objectHistoryList.append(result.node)
                result.node.removeFromParentNode()
            }
        }
    }
    
    func showDialog(position: DialogPosition, child: AnyView) {
        self.dialogVisibility = true
        if(position == DialogPosition.Top) {
            self.dialogView = AnyView(VStack {
                child
                Spacer()
            })
        } else {
            self.dialogView = AnyView(VStack {
                Spacer()
                child
            })
        }
    }
    
    func restartGame() {
        elapsedTime = 0
        focusedObjectIndex = 0
        state = StoryState.Naration
        
        let camera = self.view.defaultCameraController
        
        let cameraDestination = view.scene?.rootNode.childNodes.filter({$0.name == "CAM DEFAULT"}).first
        
        for node in objectHistoryList {
            self.view.scene?.rootNode.addChildNode(node)
        }
        
        self.objectHistoryList = []
        
        self.view.defaultCameraController.pointOfView?.worldPosition = SCNVector3(x: cameraDestination?.worldPosition.x ?? 0, y: cameraDestination?.worldPosition.y ?? 0, z: cameraDestination?.worldPosition.z ?? 0)
        self.view.defaultCameraController.pointOfView?.worldOrientation =  SCNQuaternion(x: cameraDestination?.worldOrientation.x ?? 0, y: cameraDestination?.worldOrientation.y ?? 0, z: cameraDestination?.worldOrientation.z ?? 0, w: cameraDestination?.worldOrientation.w ?? 0)
        
        endingVisibility = false
        
        playBacksound(soundName: data.backsound, soundExtention: data.backsoundExtention)
        playNaration(soundName: data.objectList[focusedObjectIndex].narationSound, soundExtention: data.objectList[focusedObjectIndex].narationSoundExtention, currentTime: 0)
    }
    
    
    func hideDialog() {
        self.dialogVisibility = false
    }
    
    func updateState() {
        if(focusedObjectIndex < data.objectList.count && endingVisibility == false) {
            let narationTime = data.objectList[focusedObjectIndex].narationDuration
            let taskTime = narationTime + data.objectList[focusedObjectIndex].taskDuration
            let tutorialTime = taskTime + data.objectList[focusedObjectIndex].tutorialDuration
            if(state == StoryState.Naration && elapsedTime > narationTime) {
                if(data.objectList[focusedObjectIndex].type == ObjectType.Opening && elapsedTime >= narationTime) {
                    elapsedTime = 0
                    state = StoryState.Naration
                    focusedObjectIndex = focusedObjectIndex + 1
                    
                    playNaration(soundName: data.objectList[focusedObjectIndex].narationSound, soundExtention: data.objectList[focusedObjectIndex].narationSoundExtention, currentTime: 0)
                } else if(data.objectList[focusedObjectIndex].type == ObjectType.Ending && elapsedTime >= narationTime) {
                    endingVisibility = true
                    global.tutorialFinished = true
                } else {
                    state = StoryState.Task
                    hideDialog()
                }
            } else if(state == StoryState.Task && elapsedTime > taskTime && data.isTutorial == true) {
                state = StoryState.Tutorial
            } else if(state == StoryState.Tutorial && elapsedTime > tutorialTime) {
                elapsedTime = taskTime + 1
                playNaration(soundName: data.objectList[focusedObjectIndex].narationSound, soundExtention: data.objectList[focusedObjectIndex].narationSoundExtention, currentTime: taskTime + 1)
            }
        } else {
            endingVisibility = true
        }
    }
    
    func configCamera() {
        let camera = view.defaultCameraController
        let cameraConfig = view.cameraControlConfiguration
        
        if(camera.pointOfView?.camera == nil) {
            return
        }
        
        camera.maximumVerticalAngle = 50
        camera.minimumVerticalAngle = 20
        
        if(camera.pointOfView!.camera!.fieldOfView > maxFov) {
            camera.pointOfView?.camera?.fieldOfView = CGFloat(maxFov)
        }
        
        if((camera.pointOfView?.camera!.fieldOfView)! < minFov) {
            camera.pointOfView?.camera?.fieldOfView = CGFloat(minFov)
        }
        
        camera.interactionMode = .orbitTurntable
        
        cameraConfig.rotationSensitivity = 0.3
        cameraConfig.panSensitivity = 0.3
    }
    
    func updateTime() {
        if(pauseVisibility) {
            return
        }
        
        elapsedTime = elapsedTime + 1
        
        configCamera()
        
        updateState()

        if(focusedObjectIndex <= data.objectList.count - 1) {
            var showedInstruction: String?
            for (index, instruction) in data.objectList[focusedObjectIndex].instructionList!.enumerated() {
                if(showedInstruction == nil) {
                    if(index != data.objectList[focusedObjectIndex].instructionList!.count - 1) {
                        if(elapsedTime >= instruction.startedAt && elapsedTime < data.objectList[focusedObjectIndex].instructionList![index + 1].startedAt) {
                            showedInstruction = instruction.text
                            
                            if(data.objectList[focusedObjectIndex].instructionList![index].gestureType != GestureType.None && state == StoryState.Tutorial) {
                                gesture = getGestureImage(gesture: data.objectList[focusedObjectIndex].instructionList![index].gestureType! )
                                gestureVisibility = true
                            } else {
                                gestureVisibility = false
                            }
                        }
                    } else {
                        showedInstruction = instruction.text
                        
                        if(data.objectList[focusedObjectIndex].instructionList![index].gestureType != GestureType.None  && state == StoryState.Tutorial) {
                            gesture = getGestureImage(gesture: data.objectList[focusedObjectIndex].instructionList![index].gestureType! )
                            gestureVisibility = true
                        } else {
                            gestureVisibility = false
                        }
                    }
                }
            }
            
            if(state != StoryState.Task && showedInstruction != nil) {
                showDialog(position: DialogPosition.Top, child: AnyView(AppRubik(text: showedInstruction!, rubikSize: fontType.body, fontWeight: .bold , fontColor: Color.text.primary)))
            }
            
            narationsProgress = CGFloat(focusedObjectIndex != 0 ? focusedObjectIndex - 1 : 0 ) / CGFloat(data.objectList.count - 2)

        } else {
            endingVisibility = true
        }
    }
    
    func getGestureImage(gesture: GestureType) -> String {
        switch(gesture) {
        case .Zoom:
            return "hand.zoom"
        case .SwipeHorizontal:
            return "hand.swipe.left"
        case .Tap:
            return "hand.tap"
        case .None:
            return "hand.zoom"
        case .SwipeVertical:
            return "hand.swip.up"
        }
    }
    
    func playBacksound(soundName: String, soundExtention: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: soundExtention)
        
        guard url != nil else {
            return
        }
        
        do {
            backsoundPlayer = try AVAudioPlayer(contentsOf: url!)
            backsoundPlayer?.setVolume(Float(global.backsoundVolume / 100), fadeDuration: 0.1)
            backsoundPlayer?.numberOfLoops = -1
            
        try AVAudioSession.sharedInstance().setCategory(.playback)
            backsoundPlayer?.play()
        } catch {
            print("error")
        }
    }
    
    func playNaration(soundName: String, soundExtention: String, currentTime: CGFloat?) {
        if(narationPlayer != nil) {
            narationPlayer?.stop()
        }
        
        let url = Bundle.main.url(forResource: soundName, withExtension: soundExtention)
        
        guard url != nil else {
            narationPlayer?.stop()
            return
        }
        
        do {
            if(soundName.count != 0) {
                narationPlayer = try AVAudioPlayer(contentsOf: url!)
                narationPlayer?.currentTime = currentTime ?? 0
                narationPlayer?.setVolume(Float(global.narationVolume / 100), fadeDuration: 0.1)
                try AVAudioSession.sharedInstance().setCategory(.playback)
                narationPlayer?.play()
            }
        } catch {
            print("error")
        }
    }
    
    func skipObject() {
        focusedObjectIndex = focusedObjectIndex + 1
        state = StoryState.Naration
        hintVisibility = false
        gestureVisibility = false
        elapsedTime = 0

        playNaration(soundName: data.objectList[focusedObjectIndex].narationSound, soundExtention: data.objectList[focusedObjectIndex].narationSoundExtention, currentTime: 0)
    }
    
    func skipTutorial() {
        global.tutorialFinished = true
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                gameView
                if(endingVisibility) {
                    EndingView(textEnding: "Sekian untuk malam ini", buttonTextEnding: "Kembali ke Menu", onRestartClick: restartGame)
                }
                if(gestureVisibility) {
                    GIFView(type: .name(gesture))
                        .frame(width: 200, height: 200)
                        .padding()
                }
                if(state != StoryState.Naration) {
                    VStack {
                        Spacer().frame(height: UIScreen.height - 240)
                        HStack{
                            Spacer()
                            AppRubik(text: data.objectList[focusedObjectIndex].hint, rubikSize: fontType.body, fontWeight: .bold , fontColor: Color.text.primary)
                            Spacer()
                        }.frame(width: UIScreen.width)
                    }
                    .frame(width:  UIScreen.width, height: UIScreen.height)
                }
                if(!pauseVisibility && !endingVisibility && data.objectList.count > 2) {
                    VStack {
                        Spacer().frame(height: UIScreen.height - 180)
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                Spacer()
                                HStack {
                                    ForEach(0...data.objectList.count - 2, id: \.self) { index in
                                        if(foundObject > index) {
                                            Image("TaskStatusFinished").resizable().frame(width: 20, height: 20)
                                        } else {
                                            Image("TaskStatusUnfinished").resizable().frame(width: 20, height: 20)
                                        }
                                    }
                                }
                                Spacer()
                            }.frame(width: UIScreen.width)
                        }.frame(height: 100)
                    }
                }
                if(pauseVisibility) {
                    PauseStoryView(buttonTextEnding: "Keluar", onRestartClick: {
                        presentationMode.wrappedValue.dismiss()
                    })
                }
                if(!endingVisibility) {
                    VStack {
                        AppProgressBar(width:300, height: 7, progress:Binding(get:{narationsProgress}, set: {_ in true}))
                            .padding(.top, 75)
                        if(dialogVisibility && !endingVisibility && global.showSubtitle) {
                                    dialogView
                                        .padding(.horizontal, 50)
                                        .padding(.top)
                                }
                            Spacer()
                        }
                        .frame(width: UIScreen.width, height: UIScreen.height)
                }
                VStack(alignment: .trailing) {
                    Spacer().frame(height: UIScreen.height -  220)
                    HStack {
                        
                        if(global.environemnt == AppEnvironment.Development) {
                            VStack {
                                AppCircleButton(
                                    size: 20,
                                    icon: Image(systemName: "arrow.right"),
                                    color: Color.white,
                                    backgroundColor: Color.foot.primary,
                                    source: AppCircleButtonContentSource.Icon,
                                    onClick: skipObject
                                )
                                
                                AppCircleButton(
                                    size: 20,
                                    icon: Image(systemName: "arrow.right.circle"),
                                    color: Color.white,
                                    backgroundColor: Color.foot.primary,
                                    source: AppCircleButtonContentSource.Icon,
                                    onClick: skipTutorial
                                )
                            }
                        }
                        
                        Spacer().frame(width: UIScreen.width - 150)
                        
                        if(state != StoryState.Naration && state != StoryState.Tutorial) {
                            AppCircleButton(
                                size: 20,
                                icon: Image(systemName: "lightbulb.fill"),
                                color: Color.bg.primary,
                                backgroundColor: Color.foot.primary,
                                source: AppCircleButtonContentSource.Icon,
                                onClick: showHint
                            )
                            .padding()
                        }
                        
                        if(state != StoryState.Naration && state == StoryState.Tutorial) {
                            
                            AppCircleButton(
                                size: 20,
                                icon: Image(systemName: "lightbulb.fill"),
                                color: Color.bg.primary,
                                backgroundColor: Color.spot.primary,
                                source: AppCircleButtonContentSource.Icon,
                                onClick: showHint
                            )
                            .padding()
                            .shadow(color: Color.spot.primary, radius: 15, x: 0, y: 0)
                        }

                    }

                }
                
            }
            .frame(width: UIScreen.width, height: UIScreen.height + 100)
            .onDisappear{
                global.isPlaying = false
                global.storyIndex = -1
                backsoundPlayer?.stop()
                narationPlayer?.stop()
            }
            .onAppear(){
                GlobalStorage.isTurorialFinished = true

                playBacksound(soundName: data.backsound, soundExtention: data.backsoundExtention)
                playNaration(soundName: data.objectList[focusedObjectIndex].narationSound, soundExtention: data.objectList[focusedObjectIndex].narationSoundExtention, currentTime: 0)
                
                gameView.loadData(scene: self.scene!, onTap: {
                        hitResults in
                    handleTap(hitResults: hitResults)
                }, view: self.view)
            }.onReceive(timer) { _ in
                updateTime()
            }.onReceive(cameraTimer) { _ in
                configCamera()
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing: Button(
            action: {
                pauseVisibility.toggle()
            }, label: {
                Image(systemName: pauseVisibility ? "xmark" : "gearshape.fill")
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.text.primary)
                        .bold()
            }
        )
        )

    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(data: storyList.first!)
    }
}
