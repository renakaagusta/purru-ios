//
//  TutorialCarouselView.swift
//  purru
//
//  Created by I Gede Bagus Wirawan on 24/11/22.
//

import SwiftUI

struct TutorialCarouselView: View{
    @ObservedObject var global = GlobalVariables.global
        
    @Binding var tabs: [Gesture]
    @Binding var currentIndex: Int
    
    @State var fakeIndex: Int = 0
    
    @State var offset: CGFloat = 0
    
    @State var genericTabs: [Gesture] = []
    
    @State private var isPresentDescriptionModal = false
        
    var body: some View{
        VStack{
            TabView(selection: $fakeIndex){
                ForEach(Array(gestureList.enumerated()),  id: \.offset) { index, tabGesture in
                        VStack {
                            TutorialGestureView(gesture: tabGesture.image, descriptionGesture: tabGesture.descriptionGesture)
                        }
                        .onPreferenceChange(OffsetKeyTutorial.self, perform: { offset in
                            self.offset = offset
                        })
                        .tag(getIndex(tab: tabGesture))
                    }
                }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
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
    
    func getIndex(tab: Gesture)->Int{
        let index = genericTabs.firstIndex { currentTab in
            return currentTab.id == tab.id
        } ?? 0
        
        return index
    }
}

struct OffsetKeyTutorial: PreferenceKey{
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

//struct Tutorial_Previews: PreviewProvider {
//    static var previews: some View {
//        TutorialView()
//    }
//}


