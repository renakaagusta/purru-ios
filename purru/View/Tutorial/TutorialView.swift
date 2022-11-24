//
//  TutorialView.swift
//  Chapper
//
//  Created by I Gede Bagus Wirawan on 20/10/22.
//

import SwiftUI

struct TutorialView: View {
    
    @ObservedObject var global = GlobalVariables.global
    
    @Binding var tabs: [Gesture]
    @Binding var currentIndex: Int
        
    @State var fakeIndex: Int = 0
    
    @State var offset: CGFloat = 0
    
    @State var genericTabs: [Gesture] = []
    
    var onClose: () -> () = {}
    
    var body: some View {
    
        VStack {
            
            AppCard(width: 280, height: 320, cornerRadius: 31, backgroundColorTop: Color.bg.primary, backgroundColorBottom: Color.bg.primary, borderColor: Color.spot.primary, backgroundImage: "") {
                
                Spacer().frame(height: 25)
                HStack(content: {
                    Spacer()
                    Button(action: {
                        onClose()
                    }, label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 15, height: 15, alignment: Alignment.trailing)
                            .foregroundColor(Color.text.primary)
                            .bold()
                            .padding(.horizontal, 30)
                    })
                })
                
                AppJosefineSans(text: "Gesture Permainan", josepSize: fontType.title2, fontWeight: Font.Weight.bold, fontColor: Color.spot.primary, textAligment: TextAlignment.center)
//                    .padding()
                
                TutorialCarouselView(tabs: $tabs, currentIndex: $currentIndex)
                
            }
            .shadow(color: Color.spot.primary, radius: 5, x: 0, y: 0)
            .padding(5)

        }
        
    }
}

//struct TutorialView_Previews: PreviewProvider {
//    static var previews: some View {
//        TutorialView()
//    }
//}
