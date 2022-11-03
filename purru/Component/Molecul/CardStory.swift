//
//  CardStoryView.swift
//  purru
//
//  Created by I Gede Bagus Wirawan on 03/11/22.
//

import SwiftUI

struct AppCardStory: View {
    
    @State var title: String = "story2_thumnail"
    @State var description: String = ""
    @State var thumbnail: String = ""
    @State var DescriptionLineLimit: Int = 3
//    @State var title: String = ""
    
    var body: some View {
        
        ZStack {
            
            AppCard(width: 275, height: 400, cornerRadius: 25, backgroundColorTop: Color.black, backgroundColorBottom: Color.bg.secondary, borderColor: Color.spot.primary) {
                    
                    Spacer(minLength: -100)
                    VStack(alignment: .leading) {
                        AppJosefineSans(text: title, josepSize: fontType.title1, fontWeight: Font.Weight.semibold, fontColor: Color.spot.primary, textAligment: TextAlignment.trailing)
                            //.frame(width: 150)
                        
                        //sinopsis button
                        Button(action: {
                            
                        }, label: {
                            AppRubik(text: description, rubikSize: fontType.body, fontWeight: Font.Weight.regular, fontColor: Color.text.primary, textAligment: TextAlignment.leading)
                                .lineLimit(DescriptionLineLimit)
                        })
                        
                    }
                    .padding(25)

                }
                .shadow(color: Color.spot.primary, radius: 3, x: 0, y: -2)
                .padding(5)
            
            Image(thumbnail)
                .resizable()
                .scaledToFit()
                .frame(width: 400.0, height: 400.0)
                .offset(y:-60)
            
            //play button
            Button(action: {
                
            }, label: {
                Image(systemName: "play.fill")
                    .padding(12.5)
                    .frame(width: .infinity, height: .infinity)
                    .background(Color.sign.primary)
                    .foregroundColor(Color.text.primary)
                    .cornerRadius(100)
            }).offset(x: 95,y:60)
                            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(colors: [Color.bg.primary, Color.bg.secondary], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        )

        
    }
}

struct CardStory_Previews: PreviewProvider {
    static var previews: some View {
        AppCardStory(title: "Ruang Ajaib", description: "Aku adalah anak gembala, selalu riang serta gembira. Karena aku rajin menabung dan tidak sombong", thumbnail: "story2_thumnail", DescriptionLineLimit: 3)
    }
}
