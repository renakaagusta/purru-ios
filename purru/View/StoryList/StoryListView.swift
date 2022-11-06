//
//  StoryListView.swift
//  Chapper
//
//  Created by renaka agusta on 19/10/22.
//

import SwiftUI
import SceneKit

struct StoryListView: View {
    
    @Binding var tabs: [StoryTab]
    @Binding var currentIndex: Int
    
    @State var fakeIndex: Int = 0
    
    @State var offset: CGFloat = 0
    
    @State var genericTabs: [StoryTab] = []
    
    var body: some View {
        
        VStack {
            
            AppJosefineSans(text: "Pilih cerita malam ini...", josepSize: fontType.largeTitle, fontWeight: Font.Weight.bold, fontColor: Color.text.primary, textAligment: TextAlignment.center)
                .frame(width: 300)
            
            
            InfiniteCarouselView(tabs: $tabs, currentIndex: $currentIndex)
            
            Spacer() 

//            List {
//                ForEach(storyList) { story in
//                    NavigationLink(destination: StoryView(data: story).navigationBarBackButtonHidden(true), label: {
//                        Text(story.title)
//                    })
//                }
//            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(colors: [Color.bg.primary, Color.bg.secondary], startPoint: .top, endPoint: .center)
                .ignoresSafeArea()
        ).onAppear{
            print("===STORY LIST VIEW APPEAR====")
            narationPlayer?.stop()
            backsoundPlayer?.stop()
        }
    }
}

struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        return VStack{}
        //StoryListView(tabs: Binding<[Tab]>, currentIndex: Binding<Int>)
    }
}
