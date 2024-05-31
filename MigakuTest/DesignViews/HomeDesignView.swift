//
//  ImageV.swift
//  MigakuTest
//
//  Created by Landon Mann on 5/29/24.
//

import SwiftUI

struct HomeDesignView: View {
    init() {
          UIScrollView.appearance().bounces = false
       }
    var body: some View {
        ScrollView([.vertical],showsIndicators: false) {
            Image("navpressdownstate")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: UIScreen.main.bounds.width, minHeight: UIScreen.main.bounds.height)
        }.ignoresSafeArea()
    }
}

#Preview {
    HomeDesignView()
}
