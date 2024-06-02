//
//  MigakuTestApp.swift
//  MigakuTest
//
//  Created by Landon Mann on 5/29/24.
//

import SwiftUI

@main
struct MigakuTestApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView<Theme>()
        }.environmentObject(Theme(themeFileName: "theme"))
    }
}
