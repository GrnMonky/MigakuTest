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
struct CardCell<Theme: UserCellTheme>: View {
    
    let card: Migaku.CardModel
    @EnvironmentObject var theme: Theme
    
    var body: some View {
        HStack(spacing: 25) {
            // Display user avatar asynchronously
            AsyncImage(url: URL(string: card.cardImageUrl ?? "")) { image in
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
                Text(card.title)
                    .font(theme.primaryFont)
                    .foregroundColor(theme.primaryTextColor)
                
                HStack(spacing: 5) {
                    // Badge for reviews
                    Text("\(card.reviews ?? 0) reviews")
                        .font(theme.badgeFont)
                        .foregroundColor(theme.badgeTextColor)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 8)
                        .background(theme.reviewBadgeBackgroundColor)
                        .cornerRadius(20)
                        .lineLimit(1)
                    
                    // Badge for new cards
                    Text("\(card.amount ?? 0) \(card.amountLabel ?? "new cards")")
                        .font(theme.badgeFont)
                        .foregroundColor(theme.badgeTextColor)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 8)
                        .background(card.amountLabelColor == nil ? theme.newCardBadgeBackgroundColor : Color(hex: card.amountLabelColor!))
                        .cornerRadius(20)
                        .lineLimit(1)
                }
                
                if let message = card.message, !message.isEmpty {
                    Text(message).foregroundColor(.red).font(.system(size: 14))
                }
            }
            
            Spacer()
        }
        .padding(.vertical, 15) // Vertical padding
        .padding(.leading, 15)
        .padding(.trailing, 0)
        .background(theme.cellBackgroundColor)
        .cornerRadius(10)
        .shadow(color: theme.shadowColor, radius: 5, x: 0, y: 2)
    }
}

#Preview {
    VStack {
        CardCell<Theme>(card: Migaku.MockCard())
            .frame(width: 360)
            .environmentObject(Theme())
        CenteredDesignView(designImage: "card").opacity(0.6).offset(y: 10)
    }
}

