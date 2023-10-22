//
//  FruitFolioApp.swift
//  FruitFolio
//
//  Created by Hamza Azhar on 10/10/2023.
//

import SwiftUI

@main
struct FruitFolioApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    var body: some Scene {
        WindowGroup {
            if self.isOnboarding {
                OnboardingView()
            }else {
                ContentView()
            }
        }
    }
}
