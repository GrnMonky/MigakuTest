//
//  NavTop.swift
//  MigakuTest
//
//  Created by Landon Mann on 5/29/24.
//

import SwiftUI

// Define the NavTopTheme protocol
protocol NavTopTheme: ObservableObject {
    var wordCountFont: Font { get }
    var wordLabelFont: Font { get }
    var wordCountTextColor: Color { get }
    var wordLabelTextColor: Color { get }
    var backgroundGradientColors: [Color] { get }
    var shadowColor: Color { get }
}

// Define the NavTop view
struct NavTop<Theme: NavTopTheme>: View {
    var wordCount: Int
    var leftAction: (() -> Void)?  // Add a closure for the button action
    @EnvironmentObject var theme: Theme

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
                    .font(theme.wordCountFont)
                    .foregroundColor(theme.wordCountTextColor)
                Text("words")
                    .font(theme.wordLabelFont)
                    .foregroundColor(theme.wordLabelTextColor)
            }
            .frame(alignment: .center)
            .padding(.vertical, 9)
            .padding(.horizontal, 15)
            .background(LinearGradient(
                gradient: Gradient(colors: theme.backgroundGradientColors),
                startPoint: .top,
                endPoint: .bottom
            ))
            .cornerRadius(25)
            .offset(CGSize(width: 0, height: -10.0))
            .shadow(color: theme.shadowColor, radius: 10, x: 0, y: 5)
            
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
        NavTop<Theme>(wordCount: 5483)
            .environmentObject(Theme())
        CenteredDesignView(designImage: "navTop").opacity(0.8)
        Spacer()
    }
}
