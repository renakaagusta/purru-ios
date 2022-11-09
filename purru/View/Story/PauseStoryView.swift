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
    
    @State var alertExitVisibility : Bool = false
    
    func onCancelClick(){
        alertExitVisibility = false
    }
    
    //onRestartClick

    var body: some View {
  
        VStack(alignment: .center) {
            
            ZStack {
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
                })
                
                if alertExitVisibility {
                    AppExitStoryAlert(onCancelClick: onCancelClick, onExitClick: onExitOptionClick
                    )
                }
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
