//
//  ThemeManager.swift
//  MigakuTest
//
//  Created by Landon Mann on 6/1/24.
//
import SwiftUI

@Observable
class Theme: ObservableObject {
    var primaryColor: Color
    var secondaryColor: Color
    var backgroundColor: Color
    var font: String
    
    // Additional colors
    var white: Color
    var lightPurple: Color
    var lightOrange: Color
    var veryLightGray: Color
    var pink: Color
    var veryLightWhite: Color
    var orange: Color
    var darkPink: Color
    var veryLightPurple: Color
    var lightBlue: Color
    
    init(themeFileName: String = "theme") {
        // Load theme settings from JSON file
        if let settings = loadThemeSettings(from: themeFileName) {
            self.primaryColor = Color(hex: settings.primaryColor)
            self.secondaryColor = Color(hex: settings.secondaryColor)
            self.backgroundColor = Color(hex: settings.backgroundColor)
            self.font = settings.fontName
            
            // Initialize additional colors
            self.white = Color(hex: settings.white)
            self.lightPurple = Color(hex: settings.lightPurple)
            self.lightOrange = Color(hex: settings.lightOrange)
            self.veryLightGray = Color(hex: settings.veryLightGray)
            self.pink = Color(hex: settings.pink)
            self.veryLightWhite = Color(hex: settings.veryLightWhite)
            self.orange = Color(hex: settings.orange)
            self.darkPink = Color(hex: settings.darkPink)
            self.veryLightPurple = Color(hex: settings.veryLightPurple)
            self.lightBlue = Color(hex: settings.lightBlue)
        } else {
            // Set default values if loading fails
            self.primaryColor = .blue
            self.secondaryColor = .green
            self.backgroundColor = .white
            self.font = "GTMaru"
            
            // Set default values for additional colors
            self.white = .white
            self.lightPurple = Color(hex: "#EDE3FF")
            self.lightOrange = Color(hex: "#FFA361")
            self.veryLightGray = Color(hex: "#F3F3F3")
            self.pink = Color(hex: "#FE6285")
            self.veryLightWhite = Color(hex: "#FEFEFE")
            self.orange = Color(hex: "#FF9345")
            self.darkPink = Color(hex: "#FE4670")
            self.veryLightPurple = Color(hex: "#ECE2FE")
            self.lightBlue = Color(hex: "#DFF4FF")
        }
    }
    
    func updateTheme(primaryColor: Color, secondaryColor: Color, backgroundColor: Color, font: String) {
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
        self.backgroundColor = backgroundColor
        self.font = font
    }
}

fileprivate struct ThemeSettings: Codable {
    var primaryColor: String
    var secondaryColor: String
    var backgroundColor: String
    var fontName: String
    var fontSize: Int
    var white: String
    var lightPurple: String
    var lightOrange: String
    var veryLightGray: String
    var pink: String
    var veryLightWhite: String
    var orange: String
    var darkPink: String
    var veryLightPurple: String
    var lightBlue: String
}

fileprivate func loadThemeSettings(from filename: String) -> ThemeSettings? {
    guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
        print("Failed to locate \(filename) in bundle.")
        return nil
    }
    
    guard let data = try? Data(contentsOf: url) else {
        print("Failed to load \(filename) from bundle.")
        return nil
    }
    
    let decoder = JSONDecoder()
    guard let settings = try? decoder.decode(ThemeSettings.self, from: data) else {
        print("Failed to decode \(filename) from bundle.")
        return nil
    }
    
    return settings
}
