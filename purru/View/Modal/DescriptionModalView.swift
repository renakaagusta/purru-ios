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
    
    @State private var hintVisibility = false
    
    @State private var dialogVisibility = false
    @State private var dialogView: AnyView = AnyView(VStack{})
    
    @State private var focusedObjectIndex = 0
    
    @State private var elapsedTime: CGFloat = 0
    
    @State private var minFov: CGFloat = 20
    @State private var maxFov: CGFloat = 110
    
    @State private var objectHistoryList: [SCNNode] = []
    
    private var onPlay: () -> Void = {}
    
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let cameraTimer = Timer.publish(every: 0, on: .main, in: .common).autoconnect()
    
    init(data: StoryData, onPlay: @escaping () -> Void) {
        self.data = data
        
        self.onPlay = onPlay
    }
    
    func handleTap(hitResults: [SCNHitTestResult]?) {
        if(hitResults == nil || state == StoryState.Naration) {
            return
        }
        
        if hitResults!.count > 0 {
            let result = hitResults![0]
            let material = result.node.geometry!.firstMaterial!
            
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.5
            
            SCNTransaction.completionBlock = {
                SCNTransaction.begin()
                SCNTransaction.animationDuration = 0.5
                
                material.emission.contents = UIColor.black
                
                SCNTransaction.commit()
            }
            
            material.emission.contents = UIColor.red
            
            SCNTransaction.commit()
            
            if(result.node.name == data.objectList[focusedObjectIndex].tag) {
                focusedObjectIndex = focusedObjectIndex + 1
                state = StoryState.Naration
                hintVisibility = false
                gestureVisibility = false
                elapsedTime = 0
                
                material.normal.contents = nil
                material.diffuse.contents = nil
                objectHistoryList.append(result.node)
                result.node.removeFromParentNode()
            }
        }
    }
    
    func updateTime() {
        elapsedTime = elapsedTime + 1
    }
    
    var body: some View {
        VStack{
            ZStack {
                Color.bg.primary.ignoresSafeArea()
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
                        .padding(.horizontal, 40)
                    Spacer().frame(height:10)
                    AppRubik(text: data.description, rubikSize: fontType.body, fontWeight: Font.Weight.regular, fontColor: Color.text.primary, textAligment: TextAlignment.leading)
                        .padding(.horizontal, 40)
                    Spacer().frame(height: 220)
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2)
                .background(Color.bg.primary)
                .offset(y:200)

                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            self.onPlay()
                        }, label: {
                            Image(systemName: "play.fill").resizable().frame(width:20, height: 20)
                                .padding(20)
                                .foregroundColor(Color.text.primary)
                                .background(Color.sign.primary)
                                .cornerRadius(100)
                        })
                        .padding()
                    }
                    .frame(height:40)
                    .background(LinearGradient(colors: [Color.clear, Color.bg.primary], startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea())
                    Spacer().frame(height: 50)
                }
                
            }
        }
    }
    
}

struct DescriptionModalView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionModalView(data: storyList.first!, onPlay: {})
    }
}
