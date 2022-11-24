//
//  TutorialGestureView.swift
//  purru
//
//  Created by I Gede Bagus Wirawan on 24/11/22.
//

import SwiftUI

struct TutorialGestureView: View {
    
    @State var gesture : String = ""
    @State var descriptionGesture : String = ""
    
    var body: some View {
        GIFView(type: .name(gesture))
            .frame(width: 200, height: 200)
            .padding()
        
        AppRubik(text: descriptionGesture, rubikSize: fontType.body, fontWeight: Font.Weight.regular, fontColor: Color.text.primary, textAligment: .center, fontStyle: rubikFont.regular)
    }
}

struct TutorialGestureView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialGestureView()
    }
}
