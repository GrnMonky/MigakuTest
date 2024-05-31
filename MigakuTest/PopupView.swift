//
//  Popup.swift
//  MigakuTest
//
//  Created by Landon Mann on 5/30/24.
//

import SwiftUI

struct PopupView: View {
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "flag.circle.fill") // Replace with the actual flag image
                    .resizable()
                    .frame(width: 100, height: 100)
                Text("9264 words")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .padding(.top, 50)
            
            VStack(spacing: 20) {
                Button(action: {
                    // Action for Study
                }) {
                    HStack {
                        Image(systemName: "book.fill")
                        Text("Study")
                            .font(.title2)
                    }
                    .frame(width: 300, height: 50)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                
                Button(action: {
                    // Action for Dictionary
                }) {
                    HStack {
                        Image(systemName: "book.closed.fill")
                        Text("Dictionary")
                            .font(.title2)
                    }
                    .frame(width: 300, height: 50)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                
                Button(action: {
                    // Action for Give feedback
                }) {
                    HStack {
                        Image(systemName: "hand.thumbsup.fill")
                        Text("Give feedback")
                            .font(.title2)
                    }
                    .frame(width: 300, height: 50)
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                
                Button(action: {
                    // Action for Settings
                }) {
                    HStack {
                        Image(systemName: "gearshape.fill")
                        Text("Settings")
                            .font(.title2)
                    }
                    .frame(width: 300, height: 50)
                    .background(Color.yellow)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            .padding(.top, 50)
            
            Spacer()
        }
        .frame(width: 300, height: 500)
        .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.red]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ZStack {
        PopupView()
    }
}
