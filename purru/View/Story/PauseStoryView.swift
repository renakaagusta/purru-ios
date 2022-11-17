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
    
    @State var backsoundVolume: CGFloat = 0
    @State var narationVolume: CGFloat = 0
    
    var onDidChangeSound: () -> () = {}
    
    func onCancelClick(){
        alertExitVisibility = false
    }

    var body: some View {
  
        ZStack(alignment: .center) {
            
            VStack(alignment: .center) {
                AppRubik(text: "Suara", rubikSize: fontType.body, fontWeight: Font.Weight.bold, fontColor: Color.text.primary, textAligment: TextAlignment.center, fontStyle: rubikFont.bold)
                
                Slider(value: $narationVolume,
                       in: 0...100,
                            step: 1) { didChange in
                        onDidChangeSound()
                        global.narationVolume = narationVolume
                    print("==NARATION VOLUME====")
                        print($global.narationVolume)
                    }.foregroundColor(Color.bg.secondary).accentColor(Color.sign.primary)
                
                AppRubik(text: "Musik", rubikSize: fontType.body, fontWeight: Font.Weight.bold, fontColor: Color.text.primary, textAligment: TextAlignment.center, fontStyle: rubikFont.bold)
                
                Slider(value: $backsoundVolume,
                       in: 0...100,
                            step: 1) { didChange in
                        onDidChangeSound()
                        global.backsoundVolume = backsoundVolume
                    print("==BACKSOUND VOLUME====")
                        print($global.backsoundVolume)
                }.foregroundColor(Color.bg.secondary).accentColor(Color.sign.primary)
                
                Toggle(isOn: $global.showSubtitle) {
                    AppRubik(text: "Narasi", rubikSize: fontType.body, fontWeight: Font.Weight.bold, fontColor: Color.text.primary, textAligment: TextAlignment.center, fontStyle: rubikFont.bold)
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
