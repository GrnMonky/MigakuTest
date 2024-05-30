//
//  3DButton.swift
//  MigakuTest
//
//  Created by Landon Mann on 5/29/24.
//

import SwiftUI

struct DuplicateShadowButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            GeometryReader { geometry in
                ZStack {
                    // Duplicate shadow button
                    configuration.label
                        .offset(x: -5, y: 5)
                        .opacity(0.5) // Adjust the opacity if needed
                    
                    // Original button
                    configuration.label
                        .offset(x: configuration.isPressed ? -5 : 0, y: configuration.isPressed ? 5 : 0)
                        .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
                    
                    Path { path in
                        let labelFrame = geometry.frame(in: .local)
                        let start = CGPoint(x: labelFrame.minX, y: labelFrame.minY)
                        let end = CGPoint(x: labelFrame.minX - 5, y: labelFrame.minY + 5)
                        path.move(to: start)
                        path.addLine(to: end)
                    }
                    .stroke(Color.black, lineWidth: 10)
                }
//                .frame(width: labelFrame.size.width, height: labelFrame.size.height)
            }
        }
        .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}


struct ContentView: View {
    var body: some View {
        Button(action: {
            print("Button pressed")
        }) {
            Text("Press Me")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
        .buttonStyle(DuplicateShadowButtonStyle())
    }
}


#Preview {
    ContentView()
}
