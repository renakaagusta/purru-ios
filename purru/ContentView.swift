//
//  ContentView.swift
//  purru
//
//  Created by renaka agusta on 25/10/22.
//

import SwiftUI
import AVFoundation

var backsoundPlayer: AVAudioPlayer? = nil
var narationPlayer: AVAudioPlayer? = nil
var soundEffectPlayer: AVAudioPlayer? = nil

class GlobalStorage {
    
   @AppStorage("IS_TUTORIAL_FINISHED") static var isTurorialFinished: Bool = false

}

class GlobalVariables: ObservableObject{
    
    static let global = GlobalVariables()
    
    // ENVIRONMENT
    @Published var environemnt = AppEnvironment.Production
    
    // USER
    @Published var tutorialFinished = false
    
    // STATE
    @Published var isPlaying = false
    @Published var isReadSinopsis = false
    
    // STORY
    @Published var storyIndex = 0
    
    // SETTING
    @Published var showSubtitle = true
    @Published var narationVolume: CGFloat = 80
    @Published var backsoundVolume: CGFloat = 25
}

struct ContentView: View {
    
    @ObservedObject var global = GlobalVariables.global
    @State var moveToMainMenu = false
    
    @State var tabs: [StoryTab] = storyListTab
    @State var currentIndex: Int = 0

    var body: some View {
        NavigationView {
            VStack {
                if(!moveToMainMenu) {
                    SplashScreenView()
                } else {
                    if(global.tutorialFinished) {
                        StoryListView(tabs: $tabs, currentIndex: $currentIndex).onAppear{
                            narationPlayer?.stop()
                            backsoundPlayer?.stop()
                        }
                    } else {
                        StoryView(data: storyList.first!)
                    }
                }
            }.onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        self.moveToMainMenu = true
                    }
                }
                
                if(GlobalStorage.isTurorialFinished == true) {
                    global.tutorialFinished = true
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
