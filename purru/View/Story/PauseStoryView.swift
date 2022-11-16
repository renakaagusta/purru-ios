//
//  PauseStoryView.swift
//  purru
//
//  Created by I Gede Bagus Wirawan on 06/11/22.
//

import SwiftUI

struct PauseStoryView: View {
    @State var buttonTextEnding: String = "Keluar"
    var onExitOptionClick: () -> () = {}
    
    @State var sliderValue : CGFloat = 0
    @State private var showGreeting = true
    
    @ObservedObject var global = GlobalVariables.global
    
    @State var alertExitVisibility : Bool = false
    
    var onDidChangeSound: () -> () = {}
    
    func onCancelClick(){
        alertExitVisibility = false
    }
    
    
    
    //onRestartClick

    var body: some View {
  
        ZStack(alignment: .center) {
            
            VStack(alignment: .center) {
                AppRubik(text: "Suara", rubikSize: fontType.body, fontWeight: Font.Weight.bold, fontColor: Color.text.primary, textAligment: TextAlignment.center, fontStyle: rubikFont.bold)
                
                Slider(value: $global.narationVolume,
                       in: 0...100,
                            step: 1) { didChange in
                        print("Did change: \(didChange)")
                        onDidChangeSound()
                        print($global.narationVolume)
                    }.foregroundColor(Color.bg.secondary).accentColor(Color.sign.primary)
                
                AppRubik(text: "Music", rubikSize: fontType.body, fontWeight: Font.Weight.bold, fontColor: Color.text.primary, textAligment: TextAlignment.center, fontStyle: rubikFont.bold)
                
                Slider(value: $global.backsoundVolume,
                       in: 0...100,
                            step: 1) { didChange in
                        print("Did change: \(didChange)")
                        onDidChangeSound()
                        print($global.backsoundVolume)
                }.foregroundColor(Color.bg.secondary).accentColor(Color.sign.primary)
                
                Toggle(isOn: $global.showSubtitle) {
                    AppRubik(text: "Subtitle", rubikSize: fontType.body, fontWeight: Font.Weight.bold, fontColor: Color.text.primary, textAligment: TextAlignment.center, fontStyle: rubikFont.bold)
                }.tint(Color.sign.primary)
                
                Button(action: {
                    //onExitOptionClick()
                    alertExitVisibility.toggle()
                }, label: {
                    AppRubik(text: buttonTextEnding, rubikSize: fontType.body, fontWeight: Font.Weight.bold, fontColor: Color.text.primary)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.foot.primary, lineWidth: 2)
                        )
                }).padding(.top, 30)
            }
            .padding(.horizontal, 40)
            
            
            if alertExitVisibility {
                AppExitStoryAlert(onCancelClick: onCancelClick, onExitClick: onExitOptionClick
                )
            }
            
            
        }
        .padding()
        .frame(width: UIScreen.width, height: UIScreen.height)
        .background(Color.bg.primary.opacity(0.8))
    }
}

struct PauseStoryView_Previews: PreviewProvider {
    static var previews: some View {
        PauseStoryView()
    }
}
