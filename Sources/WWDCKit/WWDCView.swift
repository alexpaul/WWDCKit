//
//  WWDCView.swift
//  
//
//  Created by Alex Paul on 4/5/22.
//

import SwiftUI

struct WWDCView: View {
    var body: some View {
        ScrollView {
            HStack {
                Text("WWDC22")
                    .font(.headline)
                Spacer()
                Text("Overview")
                Text("Swift Student Challenge")
            }
            .padding()
            .background(Color.black)
            Image(systemName: "chevron.left.forwardslash.chevron.right")
                .font(.largeTitle)
            VStack(alignment: .center) {
                Text("Call to code.")
                    .font(.largeTitle)
                    .padding(.bottom, 10)
                Text("Join developers worldwide from June 6 to 10 for an inspiring week of technology and community. Get a first look at Apple’s latest platforms and technologies in sessions, explore the newest tools and tips, and connect with Apple experts in labs and digital lounges. All online and at no cost.")
                    .textStyle()
                Text("In addition to the online conference, Apple will host a special day for developers and students at Apple Park on June 6 to watch the keynote and State of the Union videos together, along with the online community. Space is limited and details on how to apply to attend will be provided soon.")
                    .textStyle()
                Text("Wherever you watch from, get ready for a fantastic WWDC.")
                    .textStyle()
                Text("Talented students can showcase their creativity for the opportunity to receive an award in the [Swift Student Challenge](https://developer.apple.com/wwdc22/swift-student-challenge/).")
                    .textStyle()
            }.padding()
        }
        .foregroundColor(.white)
        .background(.primary)
    }
}

struct WWDCView_Previews: PreviewProvider {
    static var previews: some View {
        WWDCView()
    }
}


struct TextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .padding(.bottom, 10)
    }
}

extension View {
    func textStyle() -> some View {
        modifier(TextStyle())
    }
}
