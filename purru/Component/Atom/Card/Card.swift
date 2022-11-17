//
//  Card.swift
//  macnivision
//
//  Created by renaka agusta on 27/06/22.
//

import SwiftUI

struct AppCard<Content: View>: View {
    @State var width: CGFloat = 300
    @State var height: CGFloat = 300
    @State var cornerRadius: CGFloat = 20
    @State var backgroundColorTop: Color = Color.clear
    @State var backgroundColorBottom: Color = Color.clear
    @State var borderColor: Color = Color.gray
    @State var backgroundImage: String
    var content: () -> Content?
    
    init(width: CGFloat = 300, height: CGFloat = 300, cornerRadius: CGFloat = 20, backgroundColorTop: Color = Color.clear, backgroundColorBottom: Color = Color.clear, borderColor: Color = Color.white, backgroundImage: String = "", @ViewBuilder component: @escaping () -> Content?) {
        self.width = width
        self.height = height
        self.cornerRadius = cornerRadius
        self.backgroundColorTop = backgroundColorTop
        self.backgroundColorBottom = backgroundColorBottom
        self.borderColor = borderColor
        self.backgroundImage = backgroundImage
        self.content = component
    }
    
    var body: some View {
        VStack(){
            if (content != nil) {
                ZStack {
                    content()
                    Image(backgroundImage)
                        .resizable()
                        .frame(width: 280, height: 465)
                }
            }
        }
        .frame(width: width, height: height).overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(lineWidth: 2)
                .foregroundColor(borderColor)
        )
        .background(LinearGradient(colors: [backgroundColorTop, backgroundColorBottom],
                                    startPoint: .top,
                                    endPoint: .center))
        .cornerRadius(cornerRadius)
    }
}

struct AppCard_Previews: PreviewProvider {
    static var previews: some View {
        AppCard(component: {VStack{}})
    }
}

