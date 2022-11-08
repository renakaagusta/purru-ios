//
//  PauseStoryView.swift
//  purru
//
//  Created by I Gede Bagus Wirawan on 06/11/22.
//

import SwiftUI

struct PauseStoryView: View {
    @State var buttonTextEnding: String = "Keluar"
    var onRestartClick: () -> () = {}

    var body: some View {
  
        VStack(alignment: .center) {
            Button(action: onRestartClick, label: {
                AppRubik(text: buttonTextEnding, rubikSize: fontType.body, fontWeight: Font.Weight.bold, fontColor: Color.text.primary)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.foot.primary, lineWidth: 2)
                    )
            })
            
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
