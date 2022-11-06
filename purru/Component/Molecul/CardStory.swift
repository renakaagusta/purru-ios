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
    @State var isActive: Bool = false

//    @State var title: String = ""
    var onClick: () -> Void = {}
    
    var body: some View {
        
        VStack {
            NavigationLink(destination: StoryView(data: storyList[index]), isActive: $isActive, label: {
                ZStack {
                    
                    AppCard(width: 280, height: 479, cornerRadius: 31, backgroundColorTop: Color.clear, backgroundColorBottom: Color.bg.secondary, borderColor: Color.spot.primary) {
                            
                            Spacer(minLength: -100)
                            VStack(alignment: .leading) {
                                AppJosefineSans(text: title, josepSize: fontType.title2, fontWeight: Font.Weight.semibold, fontColor: Color.spot.primary, textAligment: TextAlignment.trailing)
                                    .padding(.bottom,5)
                                    //.frame(width: 150)
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
                            .padding()

                        }
                        .shadow(color: Color.spot.primary, radius: 5, x: 0, y: 0)
                        .padding(5)
                    
                    Button(action: {
                        self.onClick()
                    }, label: {
                        Image(thumbnail)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 371.0, height: 371.0)
                            .offset(y:-60)
                    })
                    
                    //play button
                    //NavigationLink(destination: StoryView(data: storyList[index]), label: {

//                        Button(action: {
//                            //self.onClick()
//                            isActive = true
//                            print("kaka dua")
//                        }, label: {
//                            Image(systemName: "play.fill")
//                                .padding(12.5)
//                                .frame(width: .infinity, height: .infinity)
//                                .background(Color.sign.primary)
//                                .foregroundColor(Color.text.primary)
//                                .cornerRadius(100)
//                        })
//                        .offset(x: 95,y:60)
                        
                    //})
                    
                    Ellipse()
                        .fill(.black.opacity(0.1))
                        .frame(width: 200, height: 20)
                        .shadow(radius: 5)
                        .offset(y:270)
                                    
                }
                //.background(Color.gray.opacity(0))
            })
            .padding()
            Spacer()
        }
        
         //Here is where we use the opacity
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(.transparent)

//        .background(
//            LinearGradient(colors: [Color.bg.primary, Color.bg.secondary], startPoint: .top, endPoint: .bottom)
//                .ignoresSafeArea()
//        )

        
    }
}

struct CardStory_Previews: PreviewProvider {
    static var previews: some View {
        AppCardStory(title: "Ruang Ajaib", description: "Aku adalah anak gembala, selalu riang serta gembira. Karena aku rajin menabung dan tidak sombong", thumbnail: "story2_thumnail", DescriptionLineLimit: 3)
    }
}

