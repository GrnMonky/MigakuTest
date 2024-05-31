//
//  CenteredDesignView.swift
//  MigakuTest
//
//  Created by Landon Mann on 5/29/24.
//

import SwiftUI

struct CenteredDesignView: View {
    var designImage: String
    var body: some View {
        VStack {
            Image(designImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CenteredDesignView(designImage: "navTop")
    
}
