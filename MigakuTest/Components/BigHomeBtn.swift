//
//  BigHomeBtn.swift
//  MigakuTest
//
//  Created by Landon Mann on 5/31/24.
//

import SwiftUI

// ContentView to display the button
struct BigHomeBtn: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { geometry in
            ZStack {
                if !configuration.isPressed {
                    // 3D effect paths
                    Group {
                        Path { path in
                            path.move(to: CGPoint(x: geometry.size.width * 0.05, y: 0))
                            path.addLine(to: CGPoint(x: geometry.size.width * 0.05, y: geometry.size.height * 0.95))
                            path.addLine(to: CGPoint(x: 0, y: geometry.size.height))
                            path.addLine(to: CGPoint(x: 0, y: geometry.size.height * 0.05))
                            path.closeSubpath()
                        }
                        .fill(Color(red: 0.83, green: 0.95, blue: 1.0))
                        .stroke(Color(red: 0.0, green: 0.0, blue: 0.35), lineWidth: 2)
                        .transition(.scale(scale: 0.90, anchor: .bottomLeading))
                        
                        Path { path in
                            path.move(to: CGPoint(x: geometry.size.width * 0.05, y: geometry.size.height * 0.95))
                            path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height * 0.95))
                            path.addLine(to: CGPoint(x: geometry.size.width * 0.95, y: geometry.size.height))
                            path.addLine(to: CGPoint(x: 0, y: geometry.size.height))
                            path.closeSubpath()
                        }
                        .fill(Color(red: 0.83, green: 0.95, blue: 1.0))
                        .stroke(Color(red: 0.0, green: 0.0, blue: 0.35), lineWidth: 1)
                        .transition(.scale(scale: 0.95, anchor: .bottomLeading))
                    }
//                    .transition(.scale(scale: 0.95, anchor: .bottomLeading))
//                    .transition(.scale(scale: 0.90, anchor: .bottomLeading))
                }
                
                Rectangle()
                    .stroke(Color(red: 0.0, green: 0.0, blue: 0.35), lineWidth: 2)
                    .background(Rectangle().fill(Color(red: 0.93, green: 0.89, blue: 1.0)))
                    .overlay(configuration.label)
                    .frame(width: geometry.size.width * 0.94, height: geometry.size.height * 0.94)
                    .offset(x: configuration.isPressed ? 0 : geometry.size.width * 0.027,
                            y: configuration.isPressed ? geometry.size.height * 0.05 : -geometry.size.height * 0.027)
                    .scaleEffect(x: 1.0, y: configuration.isPressed ? 0.95 : 1.0, anchor: .bottom)
            }
        }
//        .aspectRatio(1.5, contentMode: .fit)
        .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }

}

#Preview {
    VStack {
        CenteredDesignView(designImage: "btnNoHeight").opacity(0.8)
        Button(action: {
            print("Button pressed")
        }){
            VStack(alignment: .leading, spacing: 10) {
                // Display user login name
                Text("Study all \n decks")
                    .font(.GTMaru(size: 40))
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                
                HStack(spacing: 13) {
                    // Badge for reviews
                    Text("134 reviews")
                        .font(.GTMaru(size: 14))
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.green)
                        .cornerRadius(20)
                    
                    // Badge for new cards
                    Text("18 new")
                        .font(.GTMaru(size: 14))
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.blue)
                        .cornerRadius(20)
                }.frame(width: .infinity, alignment: .center)
            }
        }
        .buttonStyle(BigHomeBtn())
        .frame(width: 310, height: 200).offset(x: -35)
        CenteredDesignView(designImage: "studyAllDecks").opacity(0.8)
    }
}