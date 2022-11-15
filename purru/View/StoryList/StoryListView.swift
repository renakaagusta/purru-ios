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
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var fakeIndex: Int = 0
    
    @State var offset: CGFloat = 0
    
    @State var genericTabs: [StoryTab] = []
    
    //custom back button
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.backward") // set image here
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.text.primary)
                .bold()
        }
    }
    

    
    var body: some View {
        
        VStack {
            Spacer().frame(height: 40)
            AppJosefineSans(text: "Pilih cerita malam ini...", josepSize: fontType.largeTitle, fontWeight: Font.Weight.bold, fontColor: Color.text.primary, textAligment: TextAlignment.center)
                .frame(width: 300)
            InfiniteCarouselView(tabs: $tabs, currentIndex: $currentIndex)
            NavigationLink(destination:  global.isPlaying ? AnyView(StoryView(data: storyList[global.storyIndex])) : AnyView(EmptyView()), tag: 1, selection: Binding(get: { global.isPlaying ? 1 : 0}, set: {_ in true})) {
                EmptyView()
            }
            Spacer()
        }
        .sheet(isPresented: $global.isReadSinopsis) {
            DescriptionModalView(data: storyList[global.storyIndex], onPlay: {
                global.isReadSinopsis = false
                global.isPlaying = true
            })
            .presentationDetents([.height(550)])
            .onDisappear {
                global.isReadSinopsis = false
            }
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(colors: [Color.bg.primary, Color.bg.secondary], startPoint: .top, endPoint: .center)
                .ignoresSafeArea()
        ).onAppear{
            print("===STORY LIST VIEW APPEAR====")
            narationPlayer?.stop()
            backsoundPlayer?.stop()
            printFonts()
        }
    }
}

struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        return VStack{}
        //StoryListView(tabs: Binding<[Tab]>, currentIndex: Binding<Int>)
    }
}


func printFonts() {
    let fontFamilyName = UIFont.familyNames
    
    for familyName in fontFamilyName {
        print("-----")
        print("family name = [\(familyName)]")
        let names = UIFont.fontNames(forFamilyName: familyName)
        print("font names = [\(names)]")
    }
}
