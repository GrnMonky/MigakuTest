//
//  UserCell.swift
//  MigakuTest
//
//  Created by Landon Mann on 5/31/24.
//

import SwiftUI

// Define the UserCellThemeProtocol
protocol UserCellTheme: ObservableObject {
    var primaryFont: Font { get }
    var badgeFont: Font { get }
    var primaryTextColor: Color { get }
    var badgeTextColor: Color { get }
    var reviewBadgeBackgroundColor: Color { get }
    var newCardBadgeBackgroundColor: Color { get }
    var cellBackgroundColor: Color { get }
    var shadowColor: Color { get }
}

// Define the UserCell struct
struct UserCell<Theme: UserCellTheme>: View {
    
    let user: GitHub.User
    @EnvironmentObject var theme: Theme
    
    var body: some View {
        HStack(spacing: 25) {
            // Display user avatar asynchronously
            AsyncImage(url: URL(string: user.avatarURL ?? "")) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
            } placeholder: {
                // Placeholder view while image is loading
                ProgressView()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
            }
            
            VStack(alignment: .leading, spacing: 10) {
                // Display user login name
                Text(user.login)
                    .font(theme.primaryFont)
                    .foregroundColor(theme.primaryTextColor)
                
                HStack(spacing: 13) {
                    // Badge for reviews
                    Text("23 reviews")
                        .font(theme.badgeFont)
                        .foregroundColor(theme.badgeTextColor)
                        .padding(5)
                        .background(theme.reviewBadgeBackgroundColor)
                        .cornerRadius(20)
                    
                    // Badge for new cards
                    Text("8 new cards")
                        .font(theme.badgeFont)
                        .foregroundColor(theme.badgeTextColor)
                        .padding(5)
                        .background(theme.newCardBadgeBackgroundColor)
                        .cornerRadius(20)
                }
            }
            
            Spacer()
        }
        .padding(.vertical, 15) // Vertical padding
        .padding(.horizontal, 15)
        .background(theme.cellBackgroundColor)
        .cornerRadius(10)
        .shadow(color: theme.shadowColor, radius: 5, x: 0, y: 2)
    }
}

#Preview {
    VStack {
        UserCell<Theme>(user: GitHub.ListUser(login: "Kanji deck", avatarURL: Bundle.main.url(forResource: "deckImage", withExtension: "png")!.absoluteString, id: 1))
            .frame(width: 360)
            .environmentObject(Theme())
        CenteredDesignView(designImage: "card").opacity(0.6).offset(y: 10)
    }
}

