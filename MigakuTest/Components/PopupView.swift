//
//  Popup.swift
//  MigakuTest
//
//  Created by Landon Mann on 5/30/24.
//

import SwiftUI

//https://www.fivestars.blog/articles/reverse-masks-how-to/
extension View {
    @inlinable
    public func reverseMask<Mask: View>(
        alignment: Alignment = .center,
        @ViewBuilder _ mask: () -> Mask
    ) -> some View {
        self.mask {
            Rectangle()
                .overlay(alignment: alignment) {
                    mask()
                        .blendMode(.destinationOut)
                }
        }
    }
}

// Define the PopupTheme protocol
protocol PopupTheme: ObservableObject {
    var buttonFont: Font { get }
    var buttonForegroundColor: Color { get }
    var buttonBackgroundColor: Color { get }
    var buttonPressedBackgroundColor: Color { get }
    var popupBackgroundGradient: LinearGradient { get }
    var textBackgroundColor: Color { get }
    var textBackgroundOpacity: Double { get }
    var capsuleFillColor: Color { get }
    var capsuleFillOpacity: Double { get }
}

// Define the PopupButtonStyle button style
struct PopupButtonStyle<Theme: PopupTheme>: ButtonStyle {
    var image: String
    @EnvironmentObject var theme: Theme
    
    func makeBody(configuration: Configuration) -> some View {
        let content = HStack(spacing: 15) {
            Image(image)
                .renderingMode(.template)
            configuration.label
                .font(theme.buttonFont)
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 15)
        .frame(maxWidth: .infinity, alignment: .leading)
        
        return content
            .foregroundColor(configuration.isPressed ? .clear : theme.buttonForegroundColor)
            .background(configuration.isPressed ? theme.buttonPressedBackgroundColor : theme.buttonBackgroundColor)
            .reverseMask(alignment: .leading) {
                if configuration.isPressed {
                    content
                }
            }
            .cornerRadius(30)
    }
}

// Define the PopupView view
struct PopupView<Theme: PopupTheme>: View {
    @EnvironmentObject var theme: Theme
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(theme.popupBackgroundGradient)
                .frame(maxWidth: .infinity, maxHeight: 500)
            
            VStack {
                VStack {
                    Image("chinaFlag")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                    Text("9264 words")
                        .font(theme.buttonFont)
                        .foregroundColor(theme.buttonForegroundColor)
                        .padding(5)
                        .background(
                            Capsule()
                                .fill(theme.capsuleFillColor.opacity(theme.capsuleFillOpacity))
                        )
                }
                .frame(width: 280, height: 140)
                .padding()
                .background(theme.textBackgroundColor.opacity(theme.textBackgroundOpacity))
                .cornerRadius(32)
                
                VStack(spacing: 20) {
                    Button(action: {
                        // Action for Study
                    }) {
                        Text("Study")
                    }
                    .buttonStyle(PopupButtonStyle<Theme>(image: "bookSVG"))
                    
                    Button(action: {
                        // Action for Dictionary
                    }) {
                        Text("Dictionary")
                    }
                    .buttonStyle(PopupButtonStyle<Theme>(image: "bookStackSVG"))
                    
                    Button(action: {
                        // Action for Give feedback
                    }) {
                        Text("Give feedback")
                    }
                    .buttonStyle(PopupButtonStyle<Theme>(image: "feedback"))
                    
                    Button(action: {
                        // Action for Settings
                    }) {
                        Text("Settings")
                    }
                    .buttonStyle(PopupButtonStyle<Theme>(image: "gear"))
                }
                .frame(maxWidth: 300)
                .frame(height: 300)
                .cornerRadius(20)
            }
            .frame(maxWidth: .infinity)
        }
        .padding(50)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ZStack {
        PopupView<Theme>()
            .environmentObject(Theme())
            .frame(width: 450)
        // CenteredDesignView(designImage: "popup").frame(width: 350).opacity(0.3)
    }
}
