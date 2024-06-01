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

struct PopupButtonStyle: ButtonStyle {
    var image: String
    
    func makeBody(configuration: Configuration) -> some View {
        let content = HStack(spacing: 15) {
            Image(image)
                .renderingMode(.template)
            configuration.label
                .font(.GTMaru(size: 20))
        }
            .padding(.vertical, 15)
            .padding(.horizontal, 15)
            .frame(maxWidth: .infinity, alignment: .leading)
        
        return content
            .foregroundColor(configuration.isPressed ? .clear : .white)
            .background(configuration.isPressed ? Color.white : Color.white.opacity(0.3))
            .reverseMask(alignment: .leading) {
                if configuration.isPressed {
                    content
                }
            }.cornerRadius(30)
    }
}

struct PopupView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.red]), startPoint: .top, endPoint: .bottom))
                .frame(maxWidth: .infinity, maxHeight: 500)
            
            VStack {
                VStack {
                    Image("chinaFlag")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                    Text("9264 words")
                        .font(.GTMaru(size: 12))
                        .foregroundColor(.white)
                        .padding(5)
                        .background(
                            Capsule()
                                .fill(Color.white.opacity(0.15))
                        )
                }
                .frame(width: 280, height: 140)
                .padding()
                .background(Color.white.opacity(0.3))
                .cornerRadius(32)
                
                VStack(spacing: 20) {
                    Button(action: {
                        // Action for Study
                    }) {
                        Text("Study")
                    }
                    .buttonStyle(PopupButtonStyle(image: "bookSVG"))
                    
                    Button(action: {
                        // Action for Dictionary
                    }) {
                        Text("Dictionary")
                    }
                    .buttonStyle(PopupButtonStyle(image: "bookStackSVG"))
                    
                    Button(action: {
                        // Action for Give feedback
                    }) {
                        Text("Give feedback")
                    }
                    .buttonStyle(PopupButtonStyle(image: "feedback"))
                    
                    Button(action: {
                        // Action for Settings
                    }) {
                        Text("Settings")
                    }
                    .buttonStyle(PopupButtonStyle(image: "gear"))
                }
                .frame(maxWidth: 300)
                .frame(height: 300)
                .cornerRadius(20)
            }
            .frame(maxWidth: .infinity)
        }
        .padding(50)
        .frame(maxWidth: .infinity) // This will make the entire view take up the available width
    }
}

#Preview {
    ZStack {
        PopupView().frame(width: 450)
        //        CenteredDesignView(designImage: "popup").frame(width: 350).opacity(0.3)
    }
}
