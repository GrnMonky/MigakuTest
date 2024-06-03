//
//  FigmaModel.swift
//  MigakuTest
//
//  Created by Landon Mann on 6/3/24.
//

import Foundation

struct Migaku {
    
    struct CardModel: Decodable, Identifiable {
        var cardImageUrl: String?  {
            return avatarURL ?? Bundle.main.url(forResource: cardImage, withExtension: "png")?.absoluteString
        }
        var title: String {
            cardTitle ?? login ?? ""
        }
        
        let id: Int
        let reviews: Int?
        let amount: Int?
        let amountLabel: String?
        let amountLabelColor: String?
        let message: String?
        
        //This could also be done by writing a custom init(from decoder: Decoder)
        private let login: String?
        private let avatarURL: String?
        private let cardTitle: String?
        private let cardImage: String?
        
        // Coding keys for decoding
        private enum CodingKeys: String, CodingKey {
            case id,reviews,amount,amountLabel,amountLabelColor,message,login,cardImage
            case cardTitle = "title"
            case avatarURL = "avatar_url"
        }
    }
    
    static func MockCard() -> CardModel {
        // Example JSON string
        let jsonString = """
        {
            "id": 1,
            "reviews": 23,
            "amount": 8,
            "amountLabel": "new cards",
            "amountLabelColor": "#ff0000",
            "message": "Test message",
            "login": "user123",
            "cardImage": "deckKanji",
            "title": "Kanji deck"
        }
        """
        
        // Convert JSON string to Data
        guard let jsonData = jsonString.data(using: .utf8) else {
            fatalError("Invalid JSON string")
        }
        
        // Decode JSON data to CardModel
        let cardModel = try! JSONDecoder().decode(CardModel.self, from: jsonData)
        
        return cardModel
    }
}
