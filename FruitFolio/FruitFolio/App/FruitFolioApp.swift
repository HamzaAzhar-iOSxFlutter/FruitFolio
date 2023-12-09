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
    @StateObject var networkManager = ConnectionManager()
    
    var body: some Scene {
        WindowGroup {
            if self.isOnboarding {
                OnboardingView()
            } else {
                TabView {
                    ContentView(favouriteManager: favouriteManager, networkManager: self.networkManager)
                        .tabItem {
                            Label("Catalogue", systemImage: "house.circle.fill")
                        }
                    
                    FavouritesView(networkManager: self.networkManager, favouriteManager: favouriteManager)
                        .tabItem {
                            Label("Favourites", systemImage: "heart.fill")
                        }
                }
            }
        }
    }
}
