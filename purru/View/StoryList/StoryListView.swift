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
    
   // @State var currentIndex: Int = 0
    
    @State var posts: [Post] = []
    
    //@State var currentIndex: Int = 0

    
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
            
            AppJosefineSans(text: "Pilih cerita malam ini...", josepSize: fontType.largeTitle, fontWeight: Font.Weight.bold, fontColor: Color.text.primary, textAligment: TextAlignment.center)
                .frame(width: 300)
            
            
            // Snap Carousel....
            SnapCarousel(index: $currentIndex, items: posts) {post in
                
                GeometryReader{proxy in
                    
                    let size = proxy.size
                    
                    let tab = storyListTab[0]
                    
                    AppCardStory(title: tab.title, description: tab.description, thumbnail: tab.thumbnail, DescriptionLineLimit: 3, index: 0, onClick: {
                        
//                        global.storyIndex = index
//                        print("====STORY INDEX===")
//                        print(index)
//                        print(global.storyIndex)
//                        print(storyList.count)
//                        print(storyList[global.storyIndex].title)
                    })
//                    Image(post.postImage)
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: size.width)
//                        .cornerRadius(12)
                }
            }
            .padding(.vertical,40)
            
            // Indicator...
            HStack(spacing: 10){
                
                ForEach(posts.indices,id: \.self){index in
                    
                    Circle()
                        .fill(Color.black.opacity(currentIndex == index ? 1 : 0.1))
                        .frame(width: 10, height: 10)
                        .scaleEffect(currentIndex == index ? 1.4 : 1)
                        .animation(.spring(), value: currentIndex == index)
                }
            }
            .padding(.bottom,40)
            
            Spacer() 

//            List {
//                ForEach(storyList) { story in
//                    NavigationLink(destination: StoryView(data: story).navigationBarBackButtonHidden(true), label: {
//                        Text(story.title)
//                    })
//                }
//            }
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
            
            for index in 1...5{
                posts.append(Post(postImage: "post\(index)"))
            }
        }
      
    }
}

struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        return VStack{}
        //StoryListView(tabs: Binding<[Tab]>, currentIndex: Binding<Int>)
    }
}
