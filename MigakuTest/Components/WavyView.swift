//
//  WavyView.swift
//  MigakuTest
//
//  Created by Landon Mann on 5/29/24.
//

import SwiftUI

/**
 Converted from
 <svg width="375" height="226" viewBox="0 0 375 226" fill="none" xmlns="http://www.w3.org/2000/svg">
 <path d="M0 -272V226C86.1614 223.206 120.51 199.424 205.23 201.34C256.061 201.34 324.178 219.252 375 219.252V-272H0Z" fill="url(#paint0_radial_2_4177)"/>
 <defs>
 <radialGradient id="paint0_radial_2_4177" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" gradientTransform="translate(178.384 206.033) rotate(-93.573) scale(208.067 334.768)">
 <stop stop-color="#FF9D29"/>
 <stop offset="1" stop-color="#FFE700"/>
 </radialGradient>
 </defs>
 </svg>

Exact:
private struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: -272))
        path.addLine(to: CGPoint(x: 0, y: 226))
        path.addCurve(to: CGPoint(x: rect.width * 205.23 / 375, y: 201.34),
                      control1: CGPoint(x: rect.width * 86.1614 / 375, y: 223.206),
                      control2: CGPoint(x: rect.width * 120.51 / 375, y: 199.424))
        path.addCurve(to: CGPoint(x: rect.width, y: 219.252),
                      control1: CGPoint(x: rect.width * 256.061 / 375, y: 201.34),
                      control2: CGPoint(x: rect.width * 324.178 / 375, y: 219.252))
        path.addLine(to: CGPoint(x: rect.width, y: -272))
        path.closeSubpath()
        return path
    }
}
**/

private struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        //added a few more pixels to y to prevent being over dragged
        path.move(to: CGPoint(x: 0, y: -600))
        path.addLine(to: CGPoint(x: 0, y: 226))
        path.addCurve(to: CGPoint(x: rect.width * 205.23 / 375, y: 201.34),
                      control1: CGPoint(x: rect.width * 86.1614 / 375, y: 223.206),
                      control2: CGPoint(x: rect.width * 120.51 / 375, y: 199.424))
        path.addCurve(to: CGPoint(x: rect.width, y: 219.252),
                      control1: CGPoint(x: rect.width * 256.061 / 375, y: 201.34),
                      control2: CGPoint(x: rect.width * 324.178 / 375, y: 219.252))
        //added a few more pixels to y to prevent being over dragged
        path.addLine(to: CGPoint(x: rect.width, y: -600))
        path.closeSubpath()
        return path
    }
}

struct WavyHeader: View {
    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            ZStack {
                CustomShape()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [Color(hex: "#FF9D29"), Color(hex: "#FFE700")]),
                            center: .init(x: 178.384 / 375, y: 206.033 / 500),
                            startRadius: 0,
                            endRadius: sqrt(pow(208.067 / 375 * screenWidth, 2) + pow(334.768 / 500 * screenWidth, 2))
                        )
                    )
                    .frame(width: screenWidth, height: 500)
                    .offset(y: 10)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ZStack {
        ScrollView([.vertical],showsIndicators: false) {
            WavyHeader()
        }.ignoresSafeArea()
        WavyDesignView().opacity(0.7)
    }
}
