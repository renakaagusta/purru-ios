//
//  PauseStoryView.swift
//  purru
//
//  Created by I Gede Bagus Wirawan on 06/11/22.
//

import SwiftUI

struct PauseStoryView: View {
    var onExitOptionClick: () -> () = {}
    var onContinueStoryClick: () -> () = {}

    
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
<<<<<<< HEAD
=======
    
    //onRestartClick
>>>>>>> 5f7e5c4 (Add StartGameView and adjust PauseStoryView)

    var body: some View {
  
        ZStack(alignment: .center) {
            
            VStack(alignment: .center) {
                AppRubik(text: "Suara", rubikSize: fontType.body, fontWeight: Font.Weight.bold, fontColor: Color.text.primary, textAligment: TextAlignment.center, fontStyle: rubikFont.bold)
                
<<<<<<< HEAD
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
=======
                HStack {
                    Image(systemName: "speaker.fill")
                        .resizable()
                        .frame(width: 10,height: 15)
                        .foregroundColor(Color.text.primary)
                
                    Slider(value: $global.narationVolume,
                           in: 0...100,
                                step: 1) { didChange in
                            print("Did change: \(didChange)")
                            onDidChangeSound()
                            print($global.narationVolume)
                        }.foregroundColor(Color.bg.secondary).accentColor(Color.sign.primary)
                    
                    Image(systemName: "speaker.wave.2.fill")
                        .resizable()
                        .frame(width: 18,height: 15)
                        .foregroundColor(Color.text.primary)
                }
                
                AppRubik(text: "Musik", rubikSize: fontType.body, fontWeight: Font.Weight.bold, fontColor: Color.text.primary, textAligment: TextAlignment.center, fontStyle: rubikFont.bold)
                
                HStack {
                    Image(systemName: "speaker.fill")
                        .resizable()
                        .frame(width: 10,height: 15)
                        .foregroundColor(Color.text.primary)
                    
                    Slider(value: $global.backsoundVolume,
                           in: 0...100,
                                step: 1) { didChange in
                            print("Did change: \(didChange)")
                            onDidChangeSound()
                            print($global.backsoundVolume)
                    }.foregroundColor(Color.bg.secondary).accentColor(Color.sign.primary)
                    
                    Image(systemName: "speaker.wave.2.fill")
                        .resizable()
                        .frame(width: 18,height: 15)
                        .foregroundColor(Color.text.primary)
                }
>>>>>>> 5f7e5c4 (Add StartGameView and adjust PauseStoryView)
                
                Toggle(isOn: $global.showSubtitle) {
                    AppRubik(text: "Narasi", rubikSize: fontType.body, fontWeight: Font.Weight.bold, fontColor: Color.text.primary, textAligment: TextAlignment.center, fontStyle: rubikFont.bold)
                }.tint(Color.sign.primary)
                
                Button(action: {
                    //onExitOptionClick()
                    //alertExitVisibility.toggle()
                    onContinueStoryClick()
                }, label: {
                    AppRubik(text: "Lanjutkan Cerita", rubikSize: fontType.body, fontWeight: Font.Weight.bold, fontColor: Color.text.primary)
                        .padding(10)
                        .frame(width: 200, height: 38)
                        .background(Color.sign.primary)
                        .cornerRadius(100)
                }).padding(.top, 30)
                
                Button(action: {
                    //onExitOptionClick()
                    alertExitVisibility.toggle()
                }, label: {
                    AppRubik(text: "Keluar dari Cerita", rubikSize: fontType.body, fontWeight: Font.Weight.medium, fontColor: Color.text.primary)
                        .padding(10)
                        .frame(width: 200, height: 38)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.wrong.primary, lineWidth: 2)
                        )
                }).padding(.top, 15)
                
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
