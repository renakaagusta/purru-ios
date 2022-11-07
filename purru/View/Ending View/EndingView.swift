//
//  EndingView.swift
//  Chapper
//
//  Created by I Gede Bagus Wirawan on 24/10/22.
//

import SwiftUI

struct EndingView: View {
    
    @State var imageEnding: String = "RuanganAjaib"
    @State var textEnding: String = "Sekian untuk malam ini"
    @State var buttonTextEnding: String = "Kembali ke Menu"
    var onRestartClick: () -> () = {}

    var body: some View {
  
        VStack(alignment: .center) {
            
            Image(imageEnding)
                .resizable()
                .frame(width: 479, height: 327)
                .padding()
            
            AppJosefineSans(text: textEnding, josepSize: fontType.largeTitle, fontWeight: Font.Weight.bold, fontColor: Color.spot.primary, textAligment: .center)
                .lineSpacing(10)
                .padding()
            
            AppJosefineSans(text: textEnding, josepSize: fontType.body, fontWeight: Font.Weight.regular, fontColor: Color.text.primary, textAligment: .center)
                .padding(.bottom)
            
            Button(action: onRestartClick, label: {
                AppRubik(text: buttonTextEnding, rubikSize: fontType.body, fontWeight: Font.Weight.bold, fontColor: Color.text.primary)
                    .padding()
                    .frame(width: .infinity, height: .infinity)
                    .background(Color.sign.primary)
                    .cornerRadius(500)
            })
            
        }
        .padding()
        .frame(width: UIScreen.width, height: UIScreen.height)
        //.background(Color.bg.primary.opacity(0.8))
        .background(
            LinearGradient(colors: [Color.black, Color.bg.primary], startPoint: .top, endPoint: .center)
                .ignoresSafeArea()
        )
        
    }
}

struct EndingView_Previews: PreviewProvider {
    static var previews: some View {
        EndingView()
    }
}
