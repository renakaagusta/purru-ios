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
                    AppCard(width: 280, height: 479, cornerRadius: 31, backgroundColorTop: Color.black, backgroundColorBottom: Color.bg.secondary, borderColor: Color.spot.primary) {
                            
                        }
                        .shadow(color: Color.spot.primary, radius: 5, x: 0, y: 0)
                        .padding(5)
                    
                    Button(action: {
                        self.onPlay()
                    }, label: {
                        Image(thumbnail)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 371.0, height: 371.0)
                            .offset(y:-60)
                    })
                    
                    VStack(alignment: .leading) {
                        AppJosefineSans(text: title, josepSize: fontType.title2, fontWeight: Font.Weight.semibold, fontColor: Color.spot.primary, textAligment: TextAlignment.trailing)
                            .padding(.bottom,5)
                        Button(action: {
                            self.onClick()
                        }, label: {
                            VStack {
                                AppRubik(text: description, rubikSize: fontType.body, fontWeight: Font.Weight.regular, fontColor: Color.text.primary, textAligment: TextAlignment.leading)
                                    .lineLimit(DescriptionLineLimit)
                                    .lineSpacing(2)
                                HStack{
                                    AppRubik(text: "Selengkapnya", rubikSize: fontType.caption1, fontWeight: Font.Weight.regular, fontColor: Color.foot.primary, textAligment: TextAlignment.center)
                                    Image(systemName: "chevron.forward")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 10, height: 10, alignment: .center)
                                        .foregroundColor(Color.foot.primary)
                                }
                                .padding(.bottom)
                                .frame(maxWidth: .infinity, alignment: .center)
                            }
                        })
                    }
                    .padding()
                    .frame(width: 280, height: UIScreen.main.bounds.height/2)
                    .offset(y:150)

                    
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
