//
//  ComponentThemes.swift
//  MigakuTest
//
//  Created by Landon Mann on 6/2/24.
//

import Foundation
import SwiftUI

extension Theme: UserCellTheme {
    
    var primaryFont: Font {
        .GTMaru(size: 15)
    }
    
    var badgeFont: Font {
        .GTMaru(size: 12)
    }
    
    var primaryTextColor: Color {
        .primary
    }
    
    var badgeTextColor: Color {
        self.white
    }
    
    var reviewBadgeBackgroundColor: Color {
        .green
    }
    
    var newCardBadgeBackgroundColor: Color {
        .blue
    }
    
    var cellBackgroundColor: Color {
        self.white
    }
    
    @_implements(UserCellTheme, shadowColor)
    var cellShadowColor: Color {
        Color.black.opacity(0.2)
    }
}

extension Theme: VectorViewTheme {
    var mainPathGradientColors: [Color] {
        [self.orange, Color.red]
    }
    
    var circleGradientColors: [Color] {
        [self.orange, Color.red]
    }
    
    var strokeColor: Color {
        .black
    }
    
    var arrowColor: Color {
        .white
    }
}

extension Theme: NavTopTheme {
    var wordCountFont: Font {
        .GTMaru(size: 20)
    }
    
    var wordLabelFont: Font {
        .GTMaru(size: 12)
    }
    
    var wordCountTextColor: Color {
        .white
    }
    
    var wordLabelTextColor: Color {
        .white
    }
    
    var backgroundGradientColors: [Color] {
        [Color(hex: "#FF9345"), Color(hex: "#FE4670")]
    }
    
    @_implements(NavTopTheme, shadowColor)
    var navShadowColor: Color {
        Color.black.opacity(0.2)
    }
}

extension Theme: WavyHeaderTheme {
    var gradientColors: [Color] {
        [Color(hex: "#FF9D29"), Color(hex: "#FFE700")]
    }
    
    var gradientCenter: UnitPoint {
        UnitPoint(x: 178.384 / 375, y: 206.033 / 500)
    }
    
    var gradientStartRadius: CGFloat {
        0
    }
    
    var gradientEndRadiusMultiplier: CGFloat {
        1.0
    }
}

extension Theme: BigHomeBtnTheme {
    var pathFillColor: Color {
        Color(red: 0.83, green: 0.95, blue: 1.0)
    }
    
    var pathStrokeColor: Color {
        Color(red: 0.0, green: 0.0, blue: 0.35)
    }
    
    var rectangleFillColor: Color {
        Color(red: 0.93, green: 0.89, blue: 1.0)
    }
    
    var rectangleStrokeColor: Color {
        Color(red: 0.0, green: 0.0, blue: 0.35)
    }
}

extension Theme: NavViewTheme {
    var shadowColors: [Color] {
        [
            Color(#colorLiteral(red: 0, green: 0, blue: 0.3529411765, alpha: 0.01176470588)),
            Color(#colorLiteral(red: 0, green: 0, blue: 0.3529411765, alpha: 0.03921568627)),
            Color(#colorLiteral(red: 0, green: 0, blue: 0.3529411765, alpha: 0.07450980392)),
            Color(#colorLiteral(red: 0, green: 0, blue: 0.3529411765, alpha: 0.0862745098)),
            Color(#colorLiteral(red: 0, green: 0, blue: 0.3529411765, alpha: 0.1019607843)),
            Color(#colorLiteral(red: 0, green: 0, blue: 0.3529411765, alpha: 0.168627451))
        ]
    }
    
    var shadowRadii: [CGFloat] {
        [1.8, 4.32, 8.14, 14.52, 27.16, 65]
    }
    
    var shadowOffsets: [CGSize] {
        [
            CGSize(width: 0, height: -0.43),
            CGSize(width: 0, height: 0.38),
            CGSize(width: 0, height: 3),
            CGSize(width: 0, height: 8),
            CGSize(width: 0, height: 15),
            CGSize(width: 0, height: 50)
        ]
    }
    
    var iconColorPrimary: Color {
        self.orange
    }
    
    var iconColorSecondary: Color {
        .gray
    }
}

extension Theme: PopupTheme {
    var buttonFont: Font {
        .GTMaru(size: 20)
    }
    
    var buttonForegroundColor: Color {
        .white
    }
    
    var buttonBackgroundColor: Color {
        .white.opacity(0.3)
    }
    
    var buttonPressedBackgroundColor: Color {
        .white
    }
    
    var popupBackgroundGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [Color.orange, Color.red]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    var textBackgroundColor: Color {
        .white
    }
    
    var textBackgroundOpacity: Double {
        0.3
    }
    
    var capsuleFillColor: Color {
        .white
    }
    
    var capsuleFillOpacity: Double {
        0.15
    }
}

extension Theme: HomeViewTheme {
    var headerBackgroundColor: Color {
        Color(hex: "#EDE3FF")
    }
    
    var todayFont: Font {
        .GTMaru(size: 20)
    }
    
    var todayTextColor: Color {
        .black
    }
}
