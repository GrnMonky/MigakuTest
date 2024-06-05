//
//  BigHomeBtn.swift
//  MigakuTest
//
//  Created by Landon Mann on 5/31/24.
//

import SwiftUI

// Define the BigHomeBtnTheme protocol
protocol BigHomeBtnTheme: ObservableObject {
    var pathFillColor: Color { get }
    var pathStrokeColor: Color { get }
    var rectangleFillColor: Color { get }
    var rectangleStrokeColor: Color { get }
}

struct MorphingShapeTop: Shape {
    var flexSmallAdjustment: CGFloat
    var flexLargeAdjustment: CGFloat
    var flexOffsetAdjustment: CGFloat
    
    let fixedSmallAdjustment: CGFloat = 0.05
    let size: CGSize
    
    var animatableData: AnimatablePair<AnimatablePair<CGFloat, CGFloat>, CGFloat> {
        get {
            AnimatablePair(AnimatablePair(flexSmallAdjustment, flexLargeAdjustment), flexOffsetAdjustment)
        }
        set {
            flexSmallAdjustment = newValue.first.first
            flexLargeAdjustment = newValue.first.second
            flexOffsetAdjustment = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = size.width
        let height = size.height
        
        path.move(to: CGPoint(x: width * flexSmallAdjustment, y: height * flexOffsetAdjustment))
        path.addLine(to: CGPoint(x: width * flexSmallAdjustment, y: height * flexLargeAdjustment))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: height * fixedSmallAdjustment))
        path.closeSubpath()
        
        return path
    }
}

struct MorphingShapeBottom: Shape {
    var flexSmallAdjustment: CGFloat
    var flexLargeAdjustment: CGFloat
    var flexOffsetAdjustment: CGFloat
    
    let fixedSmallAdjustment: CGFloat = 0.05
    let fixedLargeAdjustment: CGFloat = 0.95
    let size: CGSize
    
    var animatableData: AnimatablePair<AnimatablePair<CGFloat, CGFloat>, CGFloat> {
        get {
            AnimatablePair(AnimatablePair(flexSmallAdjustment, flexLargeAdjustment), flexOffsetAdjustment)
        }
        set {
            flexSmallAdjustment = newValue.first.first
            flexLargeAdjustment = newValue.first.second
            flexOffsetAdjustment = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = size.width
        let height = size.height
        
        // Move to the starting point at the top-left corner
        path.move(to: CGPoint(x: width * flexSmallAdjustment, y: height * flexLargeAdjustment - 4))
        // Draw line to the top-right point
        path.addLine(to: CGPoint(x: width - (flexOffsetAdjustment * width), y: height * flexLargeAdjustment))
        // Draw line to the bottom-right point
        path.addLine(to: CGPoint(x: width * fixedLargeAdjustment, y: height))
        // Draw line to the bottom-left point
        path.addLine(to: CGPoint(x: 0, y: height))
        // Close the path (back to the starting point)
        path.closeSubpath()
        
        return path
    }
}

// Define the BigHomeBtn button style
struct BigHomeBtn<Theme: BigHomeBtnTheme>: ButtonStyle {
    @EnvironmentObject var theme: Theme
    
    //Make go to 0
    //    @State var flexSmallAdjustment = 0.05//0.02//0.05
    //    //Make go to 1
    //    @State var flexLargeAdjustment = 0.95//0.97//0.95
    //    //Make go to 0.05
    //    @State var flexOffsetAdjustment = 0.0//0.01//0.0
    
    @State private var flexSmallAdjustment: CGFloat = 0.05
    @State private var flexLargeAdjustment: CGFloat = 0.95
    @State private var flexOffsetAdjustment: CGFloat = 0.0
    
    private var flexSmallAdjustmentLast: CGFloat = 0
    private var flexLargeAdjustmentLast: CGFloat = 1
    private var flexOffsetAdjustmentLast: CGFloat = 0.05
    
    private var animation = Animation.easeOut(duration: 0.3)
    
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { geometry in
            
            ZStack {
                MorphingShapeTop(
                    flexSmallAdjustment: flexSmallAdjustment,
                    flexLargeAdjustment: flexLargeAdjustment,
                    flexOffsetAdjustment: flexOffsetAdjustment,
                    size: geometry.size
                )
                .stroke(theme.pathStrokeColor, lineWidth: 5)
                .fill(theme.pathFillColor)
            }
            .onChange(of: configuration.isPressed) {
                withAnimation(animation) { // Adjust duration and curve if needed
                    flexSmallAdjustment = configuration.isPressed ? flexSmallAdjustmentLast : 0.05
                    flexLargeAdjustment = configuration.isPressed ? flexLargeAdjustmentLast : 0.95
                    flexOffsetAdjustment = configuration.isPressed ? flexOffsetAdjustmentLast : 0.0
                }
            }
            
            ZStack {
                MorphingShapeBottom(
                    flexSmallAdjustment: flexSmallAdjustment,
                    flexLargeAdjustment: flexLargeAdjustment,
                    flexOffsetAdjustment: flexOffsetAdjustment,
                    size: geometry.size
                )
                .stroke(theme.pathStrokeColor, lineWidth: 5)
                .fill(theme.pathFillColor)
                .offset(x: 5)
            }
            .onChange(of: configuration.isPressed) {
                withAnimation(animation) { // Adjust duration and curve if needed
                    flexSmallAdjustment = configuration.isPressed ? flexSmallAdjustmentLast : 0.05
                    flexLargeAdjustment = configuration.isPressed ? flexLargeAdjustmentLast : 0.95
                    flexOffsetAdjustment = configuration.isPressed ? flexOffsetAdjustmentLast : 0.0
                }
            }
            
            Rectangle()
                .stroke(theme.rectangleStrokeColor, lineWidth: 3)
                .background(Rectangle().fill(theme.rectangleFillColor))
                .overlay(configuration.label)
                .frame(width: geometry.size.width - 5, height: geometry.size.height * 0.95)
                            .offset(x: configuration.isPressed ? 0 : geometry.size.width * 0.05 + 2,
                                    y: configuration.isPressed ? geometry.size.height * 0.05 : -2)
        }.animation(animation, value: configuration.isPressed)
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
                    .font(.system(size: 40))
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                
                HStack(spacing: 13) {
                    // Badge for reviews
                    Text("134 reviews")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.green)
                        .cornerRadius(20)
                    
                    // Badge for new cards
                    Text("18 new")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.blue)
                        .cornerRadius(20)
                }.frame(width: .infinity, alignment: .center)
            }
        }
        .buttonStyle(BigHomeBtn<Theme>())
        .environmentObject(Theme())
        .frame(width: 310, height: 200, alignment: .leading)
        CenteredDesignView(designImage: "studyAllDecks").opacity(0.8)
    }.offset(x: 10)
}
