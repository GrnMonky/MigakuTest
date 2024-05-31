//
//  VectorTransButton.swift
//  MigakuTest
//
//  Created by Landon Mann on 5/30/24.
//

import SwiftUI

/**
 Converted SVG to Swift Paths:
 <svg width="65" height="65" viewBox="0 0 65 65" fill="none" xmlns="http://www.w3.org/2000/svg">
 <path d="M49.2991 15.8565C60.2337 26.7911 60.2337 44.5198 49.2991 55.4544C38.3644 66.3891 20.6358 66.3891 9.70109 55.4544C-1.23359 44.5198 -1.23359 26.7911 9.70109 15.8565C20.6358 4.92179 38.3644 4.92179 49.2991 15.8565Z" fill="url(#paint0_linear_2_4218)"/>
 <path d="M49.2991 55.4544C60.2337 44.5198 60.2337 26.7911 49.2991 15.8565C38.3644 4.92179 20.6358 4.92179 9.70109 15.8565M49.2991 55.4544C38.3644 66.3891 20.6358 66.3891 9.70109 55.4544C-1.23359 44.5198 -1.23359 26.7911 9.70109 15.8565M49.2991 55.4544L55.5379 49.2156M9.70109 15.8565L14.8589 10.6986" stroke="#00005A" stroke-width="2" stroke-linejoin="round"/>
 <circle cx="35.5" cy="29.6555" r="28" fill="url(#paint1_linear_2_4218)" stroke="#00005A" stroke-width="2" stroke-linejoin="round"/>
 <path d="M35.2862 44.1364L31.337 40.2151L39.5691 31.983H21.7144V26.1983H39.5691L31.337 17.9663L35.2862 14.0449L50.332 29.0907L35.2862 44.1364Z" fill="white"/>
 <defs>
 <linearGradient id="paint0_linear_2_4218" x1="15.2008" y1="21.3562" x2="46.6277" y2="52.7832" gradientUnits="userSpaceOnUse">
 <stop stop-color="#FF9345"/>
 <stop offset="1" stop-color="#FE4670"/>
 </linearGradient>
 <linearGradient id="paint1_linear_2_4218" x1="35.5" y1="9.43323" x2="35.4999" y2="53.8777" gradientUnits="userSpaceOnUse">
 <stop stop-color="#FF9345"/>
 <stop offset="1" stop-color="#FE4670"/>
 </linearGradient>
 </defs>
 </svg>
 */

// Define the shape for the main path
struct MainPathShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 49.2991, y: 15.8565))
        path.addCurve(to: CGPoint(x: 49.2991, y: 55.4544), control1: CGPoint(x: 60.2337, y: 26.7911), control2: CGPoint(x: 60.2337, y: 44.5198))
        path.addCurve(to: CGPoint(x: 9.70109, y: 55.4544), control1: CGPoint(x: 38.3644, y: 66.3891), control2: CGPoint(x: 20.6358, y: 66.3891))
        path.addCurve(to: CGPoint(x: 9.70109, y: 15.8565), control1: CGPoint(x: -1.23359, y: 44.5198), control2: CGPoint(x: -1.23359, y: 26.7911))
        path.addCurve(to: CGPoint(x: 49.2991, y: 15.8565), control1: CGPoint(x: 20.6358, y: 4.92179), control2: CGPoint(x: 38.3644, y: 4.92179))
        path.closeSubpath()
        return path
    }
}

// Define the shape for the circle
struct CircleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addEllipse(in: CGRect(x: 7.5, y: 1.6555, width: 56, height: 56))
        return path
    }
}

// Define the shape for the arrow path
struct ArrowPathShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 35.2862, y: 44.1364))
        path.addLine(to: CGPoint(x: 31.337, y: 40.2151))
        path.addLine(to: CGPoint(x: 39.5691, y: 31.983))
        path.addLine(to: CGPoint(x: 21.7144, y: 31.983))
        path.addLine(to: CGPoint(x: 21.7144, y: 26.1983))
        path.addLine(to: CGPoint(x: 39.5691, y: 26.1983))
        path.addLine(to: CGPoint(x: 31.337, y: 17.9663))
        path.addLine(to: CGPoint(x: 35.2862, y: 14.0449))
        path.addLine(to: CGPoint(x: 50.332, y: 29.0907))
        path.closeSubpath()
        return path
    }
}

struct VectorView: View {
    var pressed: Bool
    var body: some View {
        ZStack {
            // Main path
            
            MainPathShape()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.orange, Color.red]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 65, height: 65)
            
            MainPathShape()
                .stroke(Color.black, lineWidth: 2)
                .frame(width: 65, height: 65)
            
            ZStack {
                // Circle path
                CircleShape()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.orange, Color.red]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(width: 65, height: 65)
                
                CircleShape()
                    .stroke(Color.black, lineWidth: 2)
                    .frame(width: 65, height: 65)
                
                // Arrow path
                ArrowPathShape()
                    .fill(Color.white)
                    .frame(width: 65, height: 65)
            }
            .offset(x: pressed ? -6 : 0, y: pressed ? 6 : 0)
            .animation(.easeInOut(duration: 0.1), value: pressed)
        }
    }
}

struct VectorTransitionButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            
            VectorView(pressed: configuration.isPressed)
            configuration.label
        }
        .animation(.easeInOut(duration: 0), value: configuration.isPressed)
    }
}

#Preview {
    VStack {
        CenteredDesignView(designImage: "goButtonUp").opacity(0.8).frame(width:  65, height: 65)
        Button(action: {
            print("Button pressed")
        }){
        }
        .buttonStyle(VectorTransitionButtonStyle())
        CenteredDesignView(designImage: "goButtonDown").opacity(0.8).frame(width: 65, height: 65)
    }
}
