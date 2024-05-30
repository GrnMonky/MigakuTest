//
//  WavyView.swift
//  MigakuTest
//
//  Created by Landon Mann on 5/29/24.
//

import SwiftUI

struct WavyDesignView: View {
    init() {
          UIScrollView.appearance().bounces = false
       }
    var body: some View {
        ScrollView([.vertical],showsIndicators: false) {
            Image("Vector1203") // Replace with your image name
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: UIScreen.main.bounds.width, minHeight: UIScreen.main.bounds.height)
        }.ignoresSafeArea()
    }
}

#Preview {
    WavyDesignView()
}
