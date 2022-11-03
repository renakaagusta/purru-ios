//
//  InfiniteCarouselView.swift
//  InfiniteCarousel (iOS)
//
//  Created by Balaji on 21/09/21.
//

import SwiftUI

struct InfiniteCarouselView: View{
    // Tabs...
    @Binding var tabs: [StoryTab]
    @Binding var currentIndex: Int
    
    @State var fakeIndex: Int = 0
    
    @State var offset: CGFloat = 0
    
    @State var genericTabs: [StoryTab] = []
    
    var body: some View{
        
        TabView(selection: $fakeIndex){
            ForEach(Array(storyListTab.enumerated()),  id: \.offset) { index, tab in
                NavigationLink(destination: StoryView(data: storyList[index]), label: {
                    AppCardStory(title: tab.title, description: tab.description, thumbnail: tab.thumbnail, DescriptionLineLimit: 3)
                })
                .onPreferenceChange(OffsetKey.self, perform: { offset in
                    self.offset = offset
                })
                .tag(getIndex(tab: tab))
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
        .tabViewStyle(.page(indexDisplayMode: .never))
        // max size...
        .frame(height: .infinity)
        .padding(.top,20)
        .onChange(of: offset) { newValue in
            
            // Logic...
            // Add First Item to last and when ever content is scrolled to last just scroll back to first without animation
            // Add Last Item to first and do the same
            // So it will create Infinite Carousel Type Animation...
            
            // To avoid glitch...
            // Updating after user released...
            if fakeIndex == 0 && offset == 0{
                // moving to last  - 1..
                fakeIndex = genericTabs.count - 2
            }
            if fakeIndex == genericTabs.count - 1 && offset == 0{
                fakeIndex = 1
            }
        }
        .onAppear {
            
            genericTabs = tabs
            
            // Add first and last extra two items...
            guard var first = genericTabs.first else{
                return
            }
            
            guard var last = genericTabs.last else{
                return
            }
            
            // updating ID else it will create issues in view bcz of same ID...
            
            first.id = UUID().uuidString
            last.id = UUID().uuidString
            
            genericTabs.append(first)
            genericTabs.insert(last, at: 0)
            
            fakeIndex = 1
        }
        // Updating Real Time...
        .onChange(of: tabs) { newValue in
            
            
            genericTabs = tabs
            
            // Add first and last extra two items...
            guard var first = genericTabs.first else{
                return
            }
            
            guard var last = genericTabs.last else{
                return
            }
            
            // updating ID else it will create issues in view bcz of same ID...
            
            first.id = UUID().uuidString
            last.id = UUID().uuidString
            
            genericTabs.append(first)
            genericTabs.insert(last, at: 0)
        }
        // Updating CurrentIndex...
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

// Offset Key..
struct OffsetKey: PreferenceKey{
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
