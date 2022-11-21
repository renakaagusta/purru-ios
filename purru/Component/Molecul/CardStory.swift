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
    @State var index: Int = 0

    var onClick: () -> Void = {}
    var onPlay: () -> Void = {}
    
    var body: some View {
        VStack {
            ZStack {
                    AppCard(width: 280, height: 465, cornerRadius: 31, backgroundColorTop: Color.black, backgroundColorBottom: Color.bg.secondary, borderColor: Color.spot.primary, backgroundImage: "") {
                    }
                    .shadow(color: Color.spot.primary, radius: 5, x: 0, y: 0)
                    .padding(5)
                    
                    Image(thumbnail)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 340.0, height: 340.0)
                        .offset(y:-75)

                    Rectangle()
                        .fill(LinearGradient(colors: [Color.clear, Color.bg.secondary],
                                             startPoint: .top,
                                             endPoint: .center))
                        .frame(width: 275, height: 130)
                        .offset(y:120)
                
                    Button(action: { onPlay() }, label: {
                        Image(systemName: "play.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.text.primary)

                        AppRubik(text: "Main", rubikSize: fontType.body, fontWeight: Font.Weight.bold, fontColor: Color.text.primary)
                    })
                    .padding(10)
                    .frame(width: 100, height: 38)
                    .background(Color.sign.primary)
                    .cornerRadius(100)
                    .offset(x: 70, y: 60)
                    
                    VStack(alignment: .leading) {
                        AppJosefineSans(text: title, josepSize: fontType.title2, fontWeight: Font.Weight.bold, fontColor: Color.spot.primary, textAligment: TextAlignment.leading)
                            .padding(.bottom, 5)
                            .lineLimit(3)
                        
                        AppRubik(text: description, rubikSize: fontType.footnote, fontWeight: Font.Weight.regular, fontColor: Color.text.primary, textAligment: TextAlignment.leading, fontStyle: rubikFont.regular)
                            .lineLimit(3)
                        
                    }
                    .frame(width: 230, height: UIScreen.main.bounds.height/2)
                    .offset(y:140)
                    
                    
                    Ellipse()
                        .fill(.black.opacity(0.1))
                        .frame(width: 200, height: 20)
                        .shadow(radius: 5)
                        .offset(y:270)
                    
                }
                .padding()
                Spacer()
        }
    }
}

struct CardStory_Previews: PreviewProvider {
    static var previews: some View {
        AppCardStory(title: "Ruang Ajaib", description: "Aku adalah anak gembala, selalu riang serta gembira. Karena aku rajin menabung dan tidak sombong", thumbnail: "story2_thumnail", DescriptionLineLimit: 3)
    }
}
