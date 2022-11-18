//
//  StartGameView.swift
//  purru
//
//  Created by I Gede Bagus Wirawan on 17/11/22.
//

import SwiftUI

struct StartGameView: View {
    var onStartGame: () -> () = {}
    @State var fadeOut = false
    
    var body: some View {
        
        Button(action: {
            onStartGame()
        }, label: {
            VStack{
                AppRubik(text: "Bayangkan seolah-olah kamu berada pada situasi dalam cerita", rubikSize: fontType.title3, fontWeight: Font.Weight.regular, fontColor: Color.text.primary, textAligment: TextAlignment.center, fontStyle: rubikFont.regular)
                    .frame(width: 330)
                
                AppRubik(text: "(Sentuh dimana saja untuk melanjutkan)", rubikSize: fontType.caption1, fontWeight: Font.Weight.regular, fontColor: Color.foot.primary, textAligment: TextAlignment.center, fontStyle: rubikFont.regular)
                    .padding(1)
            }
            .frame(width: UIScreen.width, height: UIScreen.height)
            .background(Color.bg.primary.opacity(0.8))
        })
        
    }
}

struct StartGameView_Previews: PreviewProvider {
    static var previews: some View {
        StartGameView()
    }
}
