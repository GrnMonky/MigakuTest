//
//  NavView.swift
//  MigakuTest
//
//  Created by Landon Mann on 5/29/24.
//

import SwiftUI

struct NavView: View {
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 100)
                    .fill(Color(UIColor.systemBackground))
                /**replicating shadow from Figma:
                 box-shadow: 0px -0.43px 1.8px 0px #00005A03;

                 box-shadow: 0px 0.38px 4.32px 0px #00005A0A;

                 box-shadow: 0px 3px 8.14px 0px #00005A13;

                 box-shadow: 0px 8px 14.52px 0px #00005A16;

                 box-shadow: 0px 15px 27.16px 0px #00005A1A;

                 box-shadow: 0px 50px 65px 0px #00005A2B;
                 **/
                
                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0.3529411765, alpha: 0.01176470588)), radius: 1.8, x: 0, y: -0.43)
                                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0.3529411765, alpha: 0.03921568627)), radius: 4.32, x: 0, y: 0.38)
                                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0.3529411765, alpha: 0.07450980392)), radius: 8.14, x: 0, y: 3)
                                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0.3529411765, alpha: 0.0862745098)), radius: 14.52, x: 0, y: 8)
                                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0.3529411765, alpha: 0.1019607843)), radius: 27.16, x: 0, y: 15)
                                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0.3529411765, alpha: 0.168627451)), radius: 65, x: 0, y: 50)                    .frame(width: 135, height: 60)
                
                HStack(spacing: 35) {
                    Image("book") // Replace with your custom icon
                        .foregroundColor(Color.orange) // Adjust the color as needed
                        .font(.system(size: 24))
                    
                    Image("bookStack") // Replace with your custom icon
                        .foregroundColor(Color.gray) // Adjust the color as needed
                        .font(.system(size: 24))
                }
            }
        }
}

#Preview {
    VStack {
        NavView()
        CenteredDesignView(designImage: "nav").opacity(0.5).frame(width: 500, height: 110).shadow(radius: 4)

    }
}
