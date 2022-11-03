//
//  MainMenuView.swift
//  Chapper
//
//  Created by renaka agusta on 19/10/22.
//

import SwiftUI

struct MainMenuView: View {
    
    @State var tabs: [StoryTab] = storyListTab
    
    @State var currentIndex: Int = 0
    
    var body: some View {
        VStack{
            StoryListView(tabs: $tabs, currentIndex: $currentIndex)
            //Text("Main Menu")
//            List {
//                NavigationLink(destination: StoryListView(tabs: $tabs, currentIndex: $currentIndex), label: {
//                    Text("Story List")
//                })
//                NavigationLink(destination: SettingView(), label: {
//                    Text("Setting")
//                })
//                NavigationLink(destination: HelpView(), label: {
//                    Text("Help")
//                })
//                NavigationLink(destination: AboutView(), label: {
//                    Text("About")
//                })
//            }
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
