//
//  EndingView.swift
//  Chapper
//
//  Created by I Gede Bagus Wirawan on 24/10/22.
//

import SwiftUI

struct EndingView: View {
    
    @State var titleEnding: String = "Sekian untuk malam ini"
    @State var textEnding: String = "Selamat beristirahat!"
    @State var buttonTextEnding: String = "Kembali ke Menu"
    
    var onRestartClick: () -> () = {}
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .center) {
                
                AppJosefineSans(text: titleEnding, josepSize: fontType.largeTitle, fontWeight: Font.Weight.bold, fontColor: Color.spot.primary, textAligment: .center)
                    .lineSpacing(10)
                    .padding()
                
                AppJosefineSans(text: textEnding, josepSize: fontType.title3, fontWeight: Font.Weight.medium, fontColor: Color.text.primary, textAligment: .center)
                    .padding(.bottom)
                
                Button(action: onRestartClick, label: {
                    AppRubik(text: buttonTextEnding, rubikSize: fontType.body, fontWeight: Font.Weight.medium, fontColor: Color.text.primary)
                        .padding()
                        .frame(width: .infinity, height: .infinity)
                        .background(Color.sign.primary)
                        .cornerRadius(100)
                })
                
            }
            .padding()
            .frame(width: UIScreen.width, height: UIScreen.height/2 - 80)
            .background(
                LinearGradient(colors: [Color.clear, Color.bg.primary], startPoint: .top, endPoint: .center)
                    .ignoresSafeArea()
            )
            .offset(y:220)
        }
        
    }
}

struct EndingView_Previews: PreviewProvider {
    static var previews: some View {
        EndingView()
    }
}
