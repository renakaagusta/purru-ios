//
//  TutorialGestureView.swift
//  purru
//
//  Created by I Gede Bagus Wirawan on 24/11/22.
//

import SwiftUI

struct TutorialGestureView: View {
    
    @State var gesture : String = ""
//    @State var descriptionGesture : String = ""
//    @State var gestureName : String = ""
    @State var descriptionView: AnyView = AnyView(VStack{})
    
    var body: some View {
        GIFView(type: .name(gesture))
            .frame(width: 200, height: 200)
            .padding(.horizontal)
            .padding(.top, -75)
            .frame(width: 280, alignment: .center)
        descriptionView
            .padding(.top, -30)
    }
}

struct TutorialGestureView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialGestureView()
    }
}
