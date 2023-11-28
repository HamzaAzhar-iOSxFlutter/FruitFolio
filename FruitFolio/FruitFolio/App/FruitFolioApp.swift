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
    @StateObject var favouriteManager: FavouriteManager = FavouriteManager()
    var body: some Scene {
        WindowGroup {
            if self.isOnboarding {
                OnboardingView()
            } else {
                TabView {
                    ContentView(favouriteManager: favouriteManager)
                        .tabItem {
                            Label("Catalogue", systemImage: "house.circle.fill")
                        }
                    
                    FavouritesView(favouriteManager: favouriteManager)
                        .tabItem {
                            Label("Favourites", systemImage: "heart.fill")
                        }
                }
            }
        }
    }
}
