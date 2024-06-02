//
//  NavView.swift
//  MigakuTest
//
//  Created by Landon Mann on 5/29/24.
//

import SwiftUI

// Define the NavViewTheme protocol
protocol NavViewTheme: ObservableObject {
    var backgroundColor: Color { get }
    var shadowColors: [Color] { get }
    var shadowRadii: [CGFloat] { get }
    var shadowOffsets: [CGSize] { get }
    var iconColorPrimary: Color { get }
    var iconColorSecondary: Color { get }
}

// Define the NavView
struct NavView<Theme: NavViewTheme>: View {
    @EnvironmentObject var theme: Theme
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 100)
                .fill(theme.backgroundColor)
                .frame(width: 135, height: 60)
                .shadow(color: theme.shadowColors[0], radius: theme.shadowRadii[0], x: theme.shadowOffsets[0].width, y: theme.shadowOffsets[0].height)
                .shadow(color: theme.shadowColors[1], radius: theme.shadowRadii[1], x: theme.shadowOffsets[1].width, y: theme.shadowOffsets[1].height)
                .shadow(color: theme.shadowColors[2], radius: theme.shadowRadii[2], x: theme.shadowOffsets[2].width, y: theme.shadowOffsets[2].height)
                .shadow(color: theme.shadowColors[3], radius: theme.shadowRadii[3], x: theme.shadowOffsets[3].width, y: theme.shadowOffsets[3].height)
                .shadow(color: theme.shadowColors[4], radius: theme.shadowRadii[4], x: theme.shadowOffsets[4].width, y: theme.shadowOffsets[4].height)
                .shadow(color: theme.shadowColors[5], radius: theme.shadowRadii[5], x: theme.shadowOffsets[5].width, y: theme.shadowOffsets[5].height)
            
            HStack(spacing: 35) {
                Image("book") // Replace with your custom icon
                    .foregroundColor(theme.iconColorPrimary)
                    .font(.system(size: 24))
                
                Image("bookStack") // Replace with your custom icon
                    .foregroundColor(theme.iconColorSecondary)
                    .font(.system(size: 24))
            }
        }
    }
}

#Preview {
    VStack {
        NavView<Theme>()
            .environmentObject(Theme())
        CenteredDesignView(designImage: "nav").opacity(0.5).frame(width: 500, height: 110).shadow(radius: 4)
    }
}
