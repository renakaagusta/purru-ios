//
//  InfiniteCarouselView.swift
//  InfiniteCarousel (iOS)
//
//  Created by Balaji on 21/09/21.
//

import SwiftUI

struct InfiniteCarouselView: View{
    @ObservedObject var global = GlobalVariables.global
        
    @Binding var tabs: [StoryTab]
    @Binding var currentIndex: Int
    
    @State var fakeIndex: Int = 0
    
    @State var offset: CGFloat = 0
    
    @State var genericTabs: [StoryTab] = []
    
    @State private var isPresentDescriptionModal = false
    
    var body: some View{
        TabView(selection: $fakeIndex){
            ForEach(Array(storyListTab.enumerated()),  id: \.offset) { index, tab in
                NavigationLink(destination: StoryView(data: storyList[index]), isActive: Binding(get: {global.storyIndex == index && global.isPlaying == true}, set: { _ in true})) {
                    VStack {
                        AppCardStory(title: tab.title, description: tab.description, thumbnail: tab.thumbnail, DescriptionLineLimit: 3, index: index , onClick: {
                            global.storyIndex = index
                            isPresentDescriptionModal.toggle()
                        })
                    }
                    .onPreferenceChange(OffsetKey.self, perform: { offset in
                        self.offset = offset
                    })
                    .tag(getIndex(tab: tab))
                    .sheet(isPresented: $isPresentDescriptionModal) {
                        DescriptionModalView(data: storyList[global.storyIndex], onPlay: {
                            isPresentDescriptionModal = false
                            global.isPlaying = true
                        })
                        .presentationDetents([.height(550)])
                    }
                }
            }
                        
//            ForEach(genericTabs){tab in
//
//                // Card View...
//
//
//                AppCardStory(title: tab.title, description: tab.description, thumbnail: tab.thumbnail, DescriptionLineLimit: 3)
//
//                .onPreferenceChange(OffsetKey.self, perform: { offset in
//                    self.offset = offset
//                })
//                .tag(getIndex(tab: tab))
//            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        //.background(Color.white)
        // max size...
        .frame(height: .infinity)
        .onChange(of: offset) { newValue in
            if fakeIndex == 0 && offset == 0{
                fakeIndex = genericTabs.count - 2
            }
            if fakeIndex == genericTabs.count - 1 && offset == 0{
                fakeIndex = 1
            }
        }
        .onAppear {
            genericTabs = tabs
            
            guard var first = genericTabs.first else{
                return
            }
            
            guard var last = genericTabs.last else{
                return
            }
            
            first.id = UUID().uuidString
            last.id = UUID().uuidString
            
            genericTabs.append(first)
            genericTabs.insert(last, at: 0)
            
            fakeIndex = 1
        }
        .onChange(of: tabs) { newValue in
            genericTabs = tabs
            
            guard var first = genericTabs.first else{
                return
            }
            
            guard var last = genericTabs.last else{
                return
            }
            
            first.id = UUID().uuidString
            last.id = UUID().uuidString
            
            genericTabs.append(first)
            genericTabs.insert(last, at: 0)
        }
        .onChange(of: fakeIndex) { newValue in
            currentIndex = fakeIndex - 1
        }
        
    }
    
    func getIndex(tab: StoryTab)->Int{
        let index = genericTabs.firstIndex { currentTab in
            return currentTab.id == tab.id
        } ?? 0
        
        return index
    }
}

struct Home_Previews1: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct OffsetKey: PreferenceKey{
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
