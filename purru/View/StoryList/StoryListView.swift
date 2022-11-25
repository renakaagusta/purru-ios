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
        ZStack {
            if(global.isPlaying) {
                StoryView(data: storyList[global.storyIndex], tutorialVisibility: false)
            } else {
                VStack {
                    Spacer().frame(height: 40)
                    AppJosefineSans(text: "Pilih cerita malam ini...", josepSize: fontType.largeTitle, fontWeight: Font.Weight.bold, fontColor: Color.text.primary, textAligment: TextAlignment.center)
                        .frame(width: 300)
                        .padding(.bottom, 30)
                    InfiniteCarouselView(tabs: $tabs, currentIndex: $currentIndex)
                    Spacer()
                }
            }
            if(global.showSplashScreen) {
                SplashView(isVisible: $global.showSplashScreen).frame(width:200, height: 300)
            }
        }
        .onAppear{
            if(narationPlayer != nil) {
                narationPlayer?.stop()
            }
            
            if(backsoundPlayer != nil) {
                backsoundPlayer?.stop()
            }
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
            narationPlayer?.stop()
            backsoundPlayer?.stop()
            printFonts()
        }
    }
}

struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        return VStack{}
    }
}

func printFonts() {
    let fontFamilyName = UIFont.familyNames
    
    for familyName in fontFamilyName {
        let names = UIFont.fontNames(forFamilyName: familyName)
    }
}

struct SplashView: View {
    @Binding var isVisible: Bool
    
    @State var index = 1
    let images = (1...95).map {
        return UIImage(named: "SplashScreen7_\($0)")!
    }
    let timer = Timer.publish(every: 0.0333, on: .main, in: .common).autoconnect()

    var body: some View {   
        VStack {
            if(isVisible) {
                VStack {
                    ZStack {
                        Image("BG_SPLASH").resizable().frame(width: 1000, height: 1000)
                        Image(uiImage: images[index])
                            .resizable()
                            .frame(width: 250, height: 200, alignment: .center)
                            .onReceive(timer) { _ in
                                self.index = self.index + 1
                                print("====TIMER====")
                                print(index)
                                if self.index >= 95 { self.index = 1 }
                            }
                    }
                }.onAppear(perform: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                        withAnimation() {
                            self.isVisible = false
                            self.index = 0
                        }
                    })
                })
            }
        }
    }
}
