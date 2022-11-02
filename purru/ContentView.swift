//
//  ContentView.swift
//  purru
//
//  Created by renaka agusta on 25/10/22.
//

import SwiftUI

final class GlobalVariables: ObservableObject{
    
    static let global = GlobalVariables()
    
    // ENVIRONMENT
    @Published var environemnt = AppEnvironment.Development
    
    // USER
    @Published var tutorialFinished = false
    
    // STORY
    @Published var showSubtitle = false
    @Published var narationVolume: CGFloat = 100
    @Published var backsoundVolume: CGFloat = 100
}

struct ContentView: View {
    
    @ObservedObject var global = GlobalVariables.global
    @State var moveToMainMenu = false

    var body: some View {
        NavigationView {
            VStack {
                if(!moveToMainMenu) {
                    SplashScreenView()
                } else {
                    if(global.tutorialFinished) {
                        MainMenuView()
                    } else {
                        StoryView(data: storyList.first!)
                    }
                }
            }.onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.moveToMainMenu = true
                    }
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
