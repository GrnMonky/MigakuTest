//
//  NavTop.swift
//  MigakuTest
//
//  Created by Landon Mann on 5/29/24.
//

import SwiftUI

struct NavTop: View {
    var wordCount: Int
    var leftAction: (() -> Void)?  // Add a closure for the button action

    var body: some View {
        HStack {
            // Fixed left icon turned into a button
            Button(action: {
                leftAction?()
            }) {
                Image("migakuBtn")
                    .resizable()
                    .frame(width: 80, height: 80)
            }

            Spacer()
            
            HStack {
                Image("flag")
                    .resizable()
                    .frame(width: 17, height: 17)
                Text(String(wordCount))
                    .font(.GTMaru(size: 20))
                    .foregroundColor(.white)
                Text("words")
                    .font(.GTMaru(size: 12))
                    .foregroundColor(.white)
            }
            .frame(alignment: .center)
            .padding(.vertical, 9)
            .padding(.horizontal, 15)
            .background(LinearGradient(
                gradient: Gradient(colors: [Color(hex: "#FF9345"), Color(hex: "#FE4670")]),
                startPoint: .top,
                endPoint: .bottom
            ))
            .cornerRadius(25)
            .offset(CGSize(width: 0, height: -10.0))
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
            
            Spacer()
            
            Image("gearBtn")
                .resizable()
                .frame(width: 80, height: 80)
        }
    }
}

#Preview {
    VStack {
        Spacer()
        NavTop(wordCount: 5483)
        CenteredDesignView(designImage: "navTop").opacity(0.8)
        Spacer()
    }
}
