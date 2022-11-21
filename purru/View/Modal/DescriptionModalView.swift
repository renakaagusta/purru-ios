//
//  DescriptionModalView.swift
//  purru
//
//  Created by I Gede Bagus Wirawan on 04/11/22.
//

import SwiftUI
import SceneKit

struct DescriptionModalView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var global = GlobalVariables.global
    
    private var data: StoryData
        
    @State private var narationsProgress: CGFloat = 0
    @State private var state: StoryState = StoryState.Naration
    
    @State private var gestureVisibility = false
    @State private var gesture = ""
    @State private var endingVisibility: Bool = false
    
    @State private var objectHistoryList: [SCNNode] = []
    
    private var onPlay: () -> Void = {}
    
    init(data: StoryData, onPlay: @escaping () -> Void) {
        self.data = data
        
        self.onPlay = onPlay
    }

    
    var body: some View {
        VStack{
            ZStack {
//                Color.bg.primary.ignoresSafeArea()
                VStack {
                    Image(data.modalCover)
                        .resizable()
                        .frame(height: 325)
                    Spacer()
                }
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.compact.down")
                        .foregroundColor(Color.text.primary)
                }
                .offset(y:-260)

                VStack(alignment: .leading) {
                    AppJosefineSans(text: data.title, josepSize: fontType.title1, fontWeight: Font.Weight.semibold, fontColor: Color.spot.primary, textAligment: TextAlignment.trailing)
                        .padding(.horizontal, 30)
                    
                    Spacer().frame(height:10)
                    
                    AppRubik(text: "Sinopsis", rubikSize: fontType.body, fontWeight: Font.Weight.bold, fontColor: Color.text.primary, textAligment: TextAlignment.leading)
                        .padding(.horizontal, 30)
                    
                    Spacer().frame(height: 4)
                    AppRubik(text: data.description, rubikSize: fontType.footnote, fontWeight: Font.Weight.regular, fontColor: Color.text.primary, textAligment: TextAlignment.leading)
                        .padding(.horizontal, 30)
                    Spacer().frame(height: 260)
                    
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2)
                .background(Color.bg.primary)
                .offset(y:200)

                VStack {
                    HStack {
                        Spacer()
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
                    }
                    .padding(30)
                    .frame(height:40)
                    .background(LinearGradient(colors: [Color.clear, Color.bg.primary], startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea())
                    Spacer().frame(height: 60)
                }
                
                HStack{
                    Spacer()
                }
                .offset(y:230)
                
            }
        }
    }
    
}

struct DescriptionModalView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionModalView(data: storyList.first!, onPlay: {})
    }
}
