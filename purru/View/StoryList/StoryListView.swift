//
//  StoryListView.swift
//  Chapper
//
//  Created by renaka agusta on 19/10/22.
//

import SwiftUI
import SceneKit

struct StoryListView: View {
    
    @ObservedObject var global = GlobalVariables.global
    
    @Binding var tabs: [StoryTab]
    @Binding var currentIndex: Int
    
    @State var carouselItemList: [StoryTab] = storyListTab
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        
    @State var offset: CGFloat = 0
    
    @State var genericTabs: [StoryTab] = []
        var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.backward")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.text.primary)
                .bold()
        }
    }
    
    var body: some View {
        VStack {
            AppJosefineSans(text: "Pilih cerita malam ini...", josepSize: fontType.largeTitle, fontWeight: Font.Weight.bold, fontColor: Color.text.primary, textAligment: TextAlignment.center)
                .frame(width: 300)
            SnapCarousel(index: $currentIndex, items: carouselItemList, onChangeIndex:  {
                if(currentIndex == carouselItemList.count - 1) {
                    carouselItemList.append(storyListTab[carouselItemList.count % storyListTab.count])
                }
            }) {story in
                GeometryReader{proxy in
                    
                    let size = proxy.size
                    
                    let tab = carouselItemList[currentIndex]
                    
                    AppCardStory(title: tab.title, description: tab.description, thumbnail: tab.thumbnail, DescriptionLineLimit: 3, index: 0, onClick: {
                        global.storyIndex = currentIndex
                    })
                }
            }
            .padding(.vertical,40)
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(colors: [Color.bg.primary, Color.bg.secondary], startPoint: .top, endPoint: .center)
                .ignoresSafeArea()
        ).onAppear{
            print("===STORY LIST VIEW APPEAR====")
            narationPlayer?.stop()
            backsoundPlayer?.stop()
            
            carouselItemList = storyListTab
            carouselItemList.insert(storyListTab.last!, at: 0)
        }
      
    }
}

struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        return VStack{}
        //StoryListView(tabs: Binding<[Tab]>, currentIndex: Binding<Int>)
    }
}
