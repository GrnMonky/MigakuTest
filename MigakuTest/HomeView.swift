//
//  ContentView.swift
//  MigakuTest
//
//  Created by Landon Mann on 5/29/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            VStack {
                WavyHeader()
                NavView()
            }
            .background(Color.init(hex: "#EDE3FF").edgesIgnoringSafeArea(.all))
        }
        NavTop(wordCount: 2483)
        .position(x: UIScreen.main.bounds.width / 2, y: 35)    }
}

#Preview {
    ZStack {
        ContentView()
        HomeDesignView().opacity(0.3)
    }
}
