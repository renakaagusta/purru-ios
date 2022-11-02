//
//  MainMenuView.swift
//  Chapper
//
//  Created by renaka agusta on 19/10/22.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        VStack{
            Text("Main Menu")
            List {
                NavigationLink(destination: StoryListView(), label: {
                    Text("Story List")
                })
                NavigationLink(destination: SettingView(), label: {
                    Text("Setting")
                })
                NavigationLink(destination: HelpView(), label: {
                    Text("Help")
                })
                NavigationLink(destination: HelpView(), label: {
                    Text("Exit")
                })

            }
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
