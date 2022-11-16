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
                    AppCard(width: 280, height: 465, cornerRadius: 31, backgroundColorTop: Color.black, backgroundColorBottom: Color.bg.secondary, borderColor: Color.spot.primary) {
                        
                    }
                    .shadow(color: Color.spot.primary, radius: 5, x: 0, y: 0)
                    .padding(5)
                    
                    Image(thumbnail)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 371.0, height: 371.0)
                        .offset(y:-60)

                    Rectangle()
                        .fill(LinearGradient(colors: [Color.clear, Color.bg.secondary],
                                             startPoint: .top,
                                             endPoint: .center))
                        .frame(width: 275, height: 150)
                        .offset(y:100)
                    
                    
                    VStack(alignment: .center) {
                        AppJosefineSans(text: title, josepSize: fontType.largeTitle, fontWeight: Font.Weight.semibold, fontColor: Color.spot.primary, textAligment: TextAlignment.center)
                            .padding(.bottom, 5)
                            .lineLimit(3)
                        
                        HStack{
                            
                            Button(action: { onClick() } , label: {
                                AppRubik(text: "Sinopsis", rubikSize: fontType.body, fontWeight: Font.Weight.medium, fontColor: Color.text.primary)
                                    .padding(10)
                                    .frame(width: 100, height: 38)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.foot.primary, lineWidth: 2)
                                    )
                            })
                            
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
                            
                        }.padding(10)
                        
                    }
                    .padding()
                    .frame(width: 280, height: UIScreen.main.bounds.height/2)
                    .offset(y:125)
                    
                    
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
