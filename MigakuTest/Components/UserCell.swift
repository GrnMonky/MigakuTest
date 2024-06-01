//
//  UserCell.swift
//  MigakuTest
//
//  Created by Landon Mann on 5/31/24.
//

import SwiftUI

struct UserCell: View {
    
    let user: GitHub.User
    
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
                    .font(.GTMaru(size: 15))
                    .foregroundColor(.primary)
                
                HStack(spacing: 13) {
                    // Badge for reviews
                    Text("23 reviews")
                        .font(.GTMaru(size: 12))
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color.green)
                        .cornerRadius(20)
                    
                    // Badge for new cards
                    Text("8 new cards")
                        .font(.GTMaru(size: 12))
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color.blue)
                        .cornerRadius(20)
                }
            }
            
            Spacer()
        }
        .padding(.vertical, 15) // Vertical padding
        .padding(.horizontal, 15)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}
#Preview {
    VStack {
        UserCell(user: GitHub.ListUser(login: "Kanji deck", avatarURL: Bundle.main.url(forResource: "deckImage", withExtension: "png")!.absoluteString, id: 1)).frame(width: 360)
        CenteredDesignView(designImage: "card").opacity(0.6).offset(y: 10)
    }
}
