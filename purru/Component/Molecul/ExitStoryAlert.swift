//
//  ExitStoryAlert.swift
//  purru
//
//  Created by I Gede Bagus Wirawan on 09/11/22.
//

import SwiftUI

struct AppExitStoryAlert: View {
    
    var onCancelClick: () -> () = {}
    var onExitClick: () -> () = {}

    var body: some View {
        
        AppCard(width: 260, height: 160, cornerRadius: 31, backgroundColorTop: Color.bg.secondary, backgroundColorBottom: Color.bg.primary, borderColor: Color.wrong.primary) {
            
            VStack(alignment: .center){
                AppJosefineSans(text: "Yakin ingin keluar?", josepSize: fontType.title2, fontWeight: Font.Weight.bold, fontColor: Color.text.primary, textAligment: TextAlignment.center)
                
                AppRubik(text: "Kamu akan kehilangan semua progres", rubikSize: .caption1, fontWeight: Font.Weight.regular, fontColor: Color.foot.primary, textAligment: TextAlignment.center)
                    .padding(2)
                
                HStack{
                    Button(action: { onCancelClick() }, label: {
                        AppRubik(text: "Tidak", rubikSize: fontType.body, fontWeight: Font.Weight.medium, fontColor: Color.text.primary)
                            .padding(10)
                            .frame(width: 80, height: .infinity)
                            .background(Color.sign.primary)
                            .cornerRadius(100)
                    })
                    
                    Button(action: { onExitClick() }, label: {
                        AppRubik(text: "Ya", rubikSize: fontType.body, fontWeight: Font.Weight.bold, fontColor: Color.text.primary)
                            .padding(10)
                            .frame(width: 80, height: .infinity)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.foot.primary, lineWidth: 2)
                            )
                    })
                }.padding(10)
                
            }
            .padding(25)
            
        }
        .shadow(color: Color.wrong.primary, radius: 5, x: 0, y: 0)
        
    }
    
}

struct AppExitStoryAlert_Previews: PreviewProvider {
    static var previews: some View {
        AppExitStoryAlert()
    }
}
