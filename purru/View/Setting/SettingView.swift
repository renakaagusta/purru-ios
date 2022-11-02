//
//  SettingView.swift
//  purru
//
//  Created by renaka agusta on 02/11/22.
//

import SwiftUI

struct SettingView: View {
    @State var sliderValue : Float = 0.0
    @State private var showGreeting = true
    
    @ObservedObject var global = GlobalVariables.global
    
    var body: some View {
        VStack {
            Text("Setting Menu")
            Spacer().frame(height: 100)
            Text("Naration Volume")
            Slider(value: $global.narationVolume,
                        in: 0...10,
                        step: 1) { didChange in
                    print("Did change: \(didChange)")
                }.padding()
            Text("Backsound Volume")
            Slider(value: $global.narationVolume,
                        in: 0...10,
                        step: 1) { didChange in
                    print("Did change: \(didChange)")
                }.padding()
            Toggle("Show welcome message", isOn: $global.showSubtitle)
        }.padding()
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
