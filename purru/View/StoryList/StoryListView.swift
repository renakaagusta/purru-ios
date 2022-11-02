//
//  StoryListView.swift
//  Chapper
//
//  Created by renaka agusta on 19/10/22.
//

import SwiftUI
import SceneKit

struct StoryListView: View {
    
    var body: some View {
        VStack {
            List {
                ForEach(storyList) { story in
                    NavigationLink(destination: StoryView(data: story).navigationBarBackButtonHidden(true), label: {
                        Text(story.title)
                    })
                }
            }
        }
    }
}

struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView()
    }
}
