//
//  StoryView.swift
//  Chapper
//
//  Created by renaka agusta on 17/10/22.

import SwiftUI
import SceneKit
import AVFoundation
import Combine

enum DialogPosition {
    case Top, Bottom
}

struct Ripple: Identifiable, Hashable {
    var id: String
    var isVisible: Bool
    var x: CGFloat
    var y: CGFloat
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
    
    @State private var focusedObjectIndex = 4
    @State private var foundObject = 0
    
    @State private var elapsedTime: CGFloat = 100
    @State private var currentNarationDuration: CGFloat = 100
    @State private var totalNarationDuration: CGFloat = 0
    
    @State private var minFov: CGFloat = 20
    @State private var maxFov: CGFloat = 110
    
    @State private var objectHistoryList: [SCNNode] = []
    
    @State private var isTutorial: Bool = false
    
    @State private var tappedXPosition: CGFloat = 0
    @State private var tappedYPosition: CGFloat = 0
    @State private var isRippleVisible: Bool = false
    @State var fadeIn = false
    @State var fadeInNaration: CGFloat = 0
    
    @State private var rippleList: [Ripple] = []
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let narationTimer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    let cameraTimer = Timer.publish(every: 0, on: .main, in: .common).autoconnect()
    
    @State var currentNaration: String? = nil
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    init(data: StoryData) {
        self.gameView = GameView()
        
        self.data = data
        self.view = SCNView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        guard let sceneUrl = Bundle.main.url(forResource: data.sceneName, withExtension: data.sceneExtension) else { fatalError() }
        
        self.scene = try! SCNScene(url: sceneUrl, options: [.checkConsistency: true])
        
        //kanan, kiri, atas, bawah, belakang, depan
        
        self.scene?.background.contents = [
            UIImage(named: data.skyBox.px), //kanan
            UIImage(named: data.skyBox.nx), //kiri
            UIImage(named: data.skyBox.py), //atas
            UIImage(named: data.skyBox.ny), //bawah
            UIImage(named: data.skyBox.pz), //belakang
            UIImage(named: data.skyBox.nz) //depan
        ]
    }
    
    func showHint() {
        if(data.objectList[focusedObjectIndex].type != ObjectType.Task) {
            return
        }
        
        let camera = self.view.defaultCameraController
        
        let cameraDestination = view.scene?.rootNode.childNodes.filter({$0.name == "CAM " + data.objectList[focusedObjectIndex].tag}).first
        
        let objectTarget = view.scene!.rootNode.childNodes.filter({$0.name == data.objectList[focusedObjectIndex].tag}).first
                
        for node in self.view.scene!.rootNode.childNodes {
            if(node.name == objectTarget?.name) {
                let material = node.geometry!.firstMaterial!
                
                SCNTransaction.begin()
                SCNTransaction.animationDuration = 1
                
                material.emission.contents = UIColor.yellow
                
                self.view.defaultCameraController.pointOfView?.worldPosition = SCNVector3(x: cameraDestination?.worldPosition.x ?? 0, y: cameraDestination?.worldPosition.y ?? 0, z: cameraDestination?.worldPosition.z ?? 0)
                
                self.view.defaultCameraController.pointOfView?.worldOrientation =  SCNQuaternion(x: cameraDestination?.worldOrientation.x ?? 0, y: cameraDestination?.worldOrientation.y ?? 0, z: cameraDestination?.worldOrientation.z ?? 0, w: cameraDestination?.worldOrientation.w ?? 0)
                
                SCNTransaction.commit()
                
                hintVisibility = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    hintVisibility = false
                }
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            for node in self.view.scene!.rootNode.childNodes {
                if(node.name == objectTarget?.name) {
                    let material = node.geometry!.firstMaterial!
                    
                    SCNTransaction.begin()
                    SCNTransaction.animationDuration = 1
                
                    material.emission.contents = UIColor.black
                    
                    SCNTransaction.commit()
                }
            }
        }
    }
    
    func handleTap(hitResults: [SCNHitTestResult]?) {
        if(hitResults == nil || state == StoryState.Naration) {
            return
        }
        
        var newObjectHistoryResult: [SCNNode] = []
        
        if hitResults!.count > 0 {
            let firstObject = hitResults![0]
            for result in self.view.scene!.rootNode.childNodes {
                if(result.name == firstObject.node.name) {
                    if(result.name == data.objectList[focusedObjectIndex].tag) {
                        SCNTransaction.begin()
                        SCNTransaction.animationDuration = 2
                    
                        result.position.y = result.position.y + Float(data.height)
                        result.opacity = 0
                        
                        SCNTransaction.commit()
                        
//                        let emitter = SCNParticleSystem(named: "\(data.particleTouch).scnp", inDirectory: nil)!
//                        let particleNode = SCNNode()
//                        particleNode.worldPosition = result.worldPosition
//                        particleNode.worldOrientation = result.worldOrientation
//                        self.view.scene?.rootNode.addChildNode(particleNode)
//                        particleNode.addParticleSystem(emitter)
                        
                        objectHistoryList.append(result)
                        newObjectHistoryResult.append(result)
                }
            }
        }
        
        if(newObjectHistoryResult.count > 0) {
            playSoundEffect(soundName: data.objectList[focusedObjectIndex].soundEffect, soundExtention: data.objectList[focusedObjectIndex].soundEffectExtention, currentTime: 0)
            playNaration(soundName: data.objectList[focusedObjectIndex].narationSound, soundExtention: data.objectList[focusedObjectIndex].narationSoundExtention, currentTime: 0)
            focusedObjectIndex = focusedObjectIndex + 1
            foundObject = foundObject + 1
            state = StoryState.Naration
            hintVisibility = false
            gestureVisibility = false
            elapsedTime = 0
            fadeIn = true
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
    
    func showEnding() {
        if(!isTutorial) {
            endingVisibility = true
            
            let node  = self.view.scene?.rootNode.childNode(withName: "Ground", recursively: true)
            print("===NODE===")
            print(node)
            
            let emitter = SCNParticleSystem(named: "\(data.particleEnding).scnp", inDirectory: nil)!
            print("===EMITTER===")
            print(emitter)
            
            self.view.scene?.rootNode.childNode(withName: "Ground", recursively: true)!.addParticleSystem(emitter)
        } else {
            GlobalStorage.isTurorialFinished = true
            global.tutorialFinished = true
        }
    }
    
    func restartGame() {
        elapsedTime = 0
        focusedObjectIndex = 0
        state = StoryState.Naration
        
        let camera = self.view.defaultCameraController
        
        let cameraDestination = view.scene?.rootNode.childNodes.filter({$0.name == "CAM DEFAULT"}).first
        
        for node in objectHistoryList {
            if(node.name != nil) {
                self.view.scene?.rootNode.childNode(withName: node.name!, recursively: true)?.opacity = 1
            }
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
                    showEnding()
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
            showEnding()
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
        
        if(state == StoryState.Naration) {
            currentNarationDuration = currentNarationDuration + 1
        }
        
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
            
            if(currentNaration != showedInstruction) {
                fadeInNaration = 0
                currentNaration = showedInstruction
            }
            
            if(state != StoryState.Task && showedInstruction != nil) {
                showDialog(position: DialogPosition.Top, child: AnyView(AppRubik(text: showedInstruction!, rubikSize: fontType.body, fontWeight: .regular, fontColor: Color.text.primary, fontStyle: .italic)))
            }
            
            narationsProgress = currentNarationDuration / totalNarationDuration
            
        } else {
            showEnding()
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
            backsoundPlayer?.setVolume(Float(global.backsoundVolume / 100 * data.backsoundVolumeFactor), fadeDuration: 0.1)
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
                narationPlayer?.setVolume(Float(global.narationVolume / 100 * data.narationVolumeFactor), fadeDuration: 0.1)
                try AVAudioSession.sharedInstance().setCategory(.playback)
                narationPlayer?.play()
            }
        } catch {
            print("error")
        }
    }
    
    func playSoundEffect(soundName: String, soundExtention: String, currentTime: CGFloat?) {
        if(soundEffectPlayer != nil) {
            soundEffectPlayer?.stop()
        }
        
        let url = Bundle.main.url(forResource: soundName, withExtension: soundExtention)
        
        guard url != nil else {
            soundEffectPlayer?.stop()
            return
        }
        
        do {
            if(soundName.count != 0) {
                soundEffectPlayer = try AVAudioPlayer(contentsOf: url!)
                soundEffectPlayer?.currentTime = currentTime ?? 0
                soundEffectPlayer?.setVolume(1.0, fadeDuration: 0.1)
                try AVAudioSession.sharedInstance().setCategory(.playback)
                soundEffectPlayer?.play()
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
                gameView.onTapGesture { location in
                    rippleList.append(Ripple(id: String(rippleList.count), isVisible: true, x:  location.x, y:  location.y))
                }
                ForEach($rippleList, id: \.self) { ripple in
                    RippleView(isVisible: ripple.isVisible, x: ripple.x, y: ripple.y)
                }
                if(endingVisibility) {
                    EndingView(titleEnding: "Sekian untuk malam ini", textEnding: "Selamat beristirahat!", buttonTextEnding: "Kembali ke Menu", onRestartClick: {
                        presentationMode.wrappedValue.dismiss()
                    })
                }
                if(gestureVisibility) {
                    GIFView(type: .name(gesture))
                        .frame(width: 200, height: 200)
                        .padding()
                }
                if(state != StoryState.Naration) {
                    VStack {
                        Spacer().frame(height: UIScreen.height - 360)
                        HStack{
                            Spacer()
                            AppJosefineSans(text: data.objectList[focusedObjectIndex].hint, josepSize: fontType.title3, fontWeight: Font.Weight.bold, fontColor: Color.text.primary, textAligment: .center)
                            Spacer()
                        }.frame(width: UIScreen.width)
                    }
                    .onAppear() {
                        withAnimation(Animation.easeIn(duration: 0.6)){
                                    fadeIn.toggle()
                                }
                            }.opacity(fadeIn ? 0 : 1)
                    .frame(width:  UIScreen.width, height: UIScreen.height)
                }
                if(!pauseVisibility && !endingVisibility && data.objectList.count > 2) {
                    VStack {
//                        Spacer().frame(height: UIScreen.height - 180)
//                        ScrollView (.horizontal, showsIndicators: false) {
//                            HStack {
//                                Spacer()
//                                HStack {
//                                    ForEach(0...data.objectList.count - 2, id: \.self) { index in
//                                        if(foundObject > index) {
//                                            Image("TaskStatusFinished").resizable().frame(width: 20, height: 20)
//                                        } else {
//                                            Image("TaskStatusUnfinished").resizable().frame(width: 20, height: 20)
//                                        }
//                                    }
//                                }
//                                Spacer()
//                            }.frame(width: UIScreen.width)
//                        }.frame(height: 100)
                    }
                }
                if(!endingVisibility) {
                    VStack {
                        AppProgressBar(width:300, height: 7, progress:Binding(get:{narationsProgress}, set: {_ in true}))
                            .padding(.top, 75)
                        if(dialogVisibility && !endingVisibility && global.showSubtitle) {
                            dialogView
                                
                                .onReceive(narationTimer) { _ in
                                    if(fadeInNaration < 1) {
                                        fadeInNaration = fadeInNaration + 0.3
                                    }
                                }
                                .animation(.easeIn)
                                .opacity(1)
                                .padding(.horizontal, 50)
                                .padding(.top)
                        }
                        Spacer()
                    }
                    .frame(width: UIScreen.width, height: UIScreen.height)
                }
                VStack(alignment: .trailing) {
                    Spacer().frame(height: UIScreen.height - 160)
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
                        
                        Spacer().frame(width: UIScreen.width - 100)
                        
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
                .onAppear() {
                    withAnimation(Animation.easeIn(duration: 0.6)){
                                fadeIn.toggle()
                            }
                        }.opacity(fadeIn ? 0 : 1)
                
                if(pauseVisibility) {
                    PauseStoryView(buttonTextEnding: "Keluar", onExitOptionClick: {
                        presentationMode.wrappedValue.dismiss()
                        pauseVisibility = false
                    }, backsoundVolume: global.backsoundVolume, narationVolume: global.narationVolume, onDidChangeSound: {
                        backsoundPlayer?.setVolume(Float(global.backsoundVolume / 100 * data.backsoundVolumeFactor), fadeDuration: 0.1)
                        narationPlayer?.setVolume(Float(global.narationVolume / 100 * data.narationVolumeFactor), fadeDuration: 0.1)
                    } )
                }
                
            }
            .frame(width: UIScreen.width, height: UIScreen.height + 100)
            .onDisappear{
                global.isPlaying = false
                global.storyIndex = 0
                global.tutorialFinished = true
                global.showSubtitle = true
                GlobalStorage.isTurorialFinished = true
                backsoundPlayer?.stop()
                narationPlayer?.stop()
            }
            .onAppear(){
                isTutorial = !global.tutorialFinished
                
                GlobalStorage.isTurorialFinished = true
                
                playBacksound(soundName: data.backsound, soundExtention: data.backsoundExtention)
                playNaration(soundName: data.objectList[focusedObjectIndex].narationSound, soundExtention: data.objectList[focusedObjectIndex].narationSoundExtention, currentTime: 0)
                
                gameView.loadData(scene: self.scene!, onTap: {
                    hitResults in
                    handleTap(hitResults: hitResults)
                }, view: self.view)
                
                if(self.view.scene != nil) {
                
                    let emitter = SCNParticleSystem(named: "ParticleEndingView.scnp", inDirectory: nil)
                    
                    for node in self.view.scene!.rootNode.childNodes {
                        if(node.name == "Ground") {}
                    }
                }

                totalNarationDuration = 0
                for object in data.objectList {
                    totalNarationDuration = totalNarationDuration + object.narationDuration
                }
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
                if pauseVisibility {
                    narationPlayer?.pause()
                } else {
                    narationPlayer?.play()
                }
            }, label: {
                if(!endingVisibility && !isTutorial){
                    Image(systemName: pauseVisibility ? "xmark" : "pause.fill")
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.text.primary)
                        .bold()
                }
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

struct RippleView: View {
    @Binding var isVisible: Bool
    @Binding var x: CGFloat
    @Binding var y: CGFloat
    
    var rippleImageView: UIImageView!
    var rippleImageList: [UIImage] = [UIImage(named: "tamanpurru")!, UIImage(named: "alcheworld")!]
    
    @State var index = 0
    let images = (0...60).map { UIImage(named: "Ripple_\($0)")! }
    let timer = Timer.publish(every: 0.03, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            if(isVisible) {
                VStack {
                    Image(uiImage: images[index])
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                        .onReceive(timer) { _ in
                            self.index = self.index + 1
                            if self.index >= 60 { self.index = 0 }
                        }
                        .position(x: x, y: y)
                }.onAppear(perform: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.4, execute: {
                        self.isVisible = false
                        self.index = 0
                    })
                })
            }
        }
    }
}
