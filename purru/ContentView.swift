//
//  ContentView.swift
//  purru
//
//  Created by renaka agusta on 25/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            StoryListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
