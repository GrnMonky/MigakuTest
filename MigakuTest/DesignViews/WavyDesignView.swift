//
//  WavyView.swift
//  MigakuTest
//
//  Created by Landon Mann on 5/29/24.
//

import SwiftUI

struct WavyDesignView: View {
    var body: some View {
        VStack {
            Image("Vector1203")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
            Spacer() // Push the image to the top
        }
        .edgesIgnoringSafeArea(.top) // This ensures the image is positioned at the very top
    }
}

#Preview {
    WavyDesignView()
}
