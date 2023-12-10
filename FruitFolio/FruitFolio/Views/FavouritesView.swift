//
//  FavouritesView.swift
//  FruitFolio
//
//  Created by Daniyal Siddiqui on 2023-11-29.
//

import SwiftUI

struct FavouritesView: View {
    @State var isShowingToast: Bool = false
    @ObservedObject var networkManager: ConnectionManager
    @ObservedObject var favouriteManager: FavouriteManager
    @State private var networkStatus: NetworkStatus = .success
    @State private var isFirstCheckDone: Bool = false
    @State private var category: Category = .fruits
    var body: some View {
        NavigationView {
            
            ZStack {
                switch self.networkManager.isConnected {
                case true:
                    if isFirstCheckDone {
                        self.showToastOnConnectionStatus(status: .success)
                    }
                case false:
                    self.showToastOnConnectionStatus(status: .failure)
                }
                
                switch self.favouriteManager.favouriteFruits.isEmpty && self.favouriteManager.favouriteVegetables.isEmpty {
                case true:
                    Text("No Favourites yet!")
                        .font(.title2)
                case false:
                    VStack {
                        
                        Picker("", selection: $category) {
                            Text("Fruits").tag(Category.fruits)
                            Text("Vegetables").tag(Category.vegetables)
                        }
                        .frame(width: 200)
                        .pickerStyle(.segmented)
                        .padding(10)
                        
                        switch category {
                        case .fruits:
                            List {
                                ForEach(self.favouriteManager.favouriteFruits.shuffled()) { item in
                                    NavigationLink(destination: FruitDetailView(fruit: item, favouriteManager: self.favouriteManager)) {
                                        FruitRowView(fruit: item)
                                            .padding(.vertical, 4)
                                        
                                    }
                                    
                                }.background(.clear)
                            }//: LIST
                            .navigationTitle("Favourites")
                            .navigationBarTitleDisplayMode(.large)
                        case .vegetables:
                            List {
                                ForEach(self.favouriteManager.favouriteVegetables.shuffled()) { item in
                                    NavigationLink(destination: VegetableDetailView(vegetable: item, favouriteManager: self.favouriteManager)) {
                                        VegetableRowView(vegetable: item)
                                            .padding(.vertical, 4)
                                        
                                    }
                                }.background(.clear)
                            }//: LIST
                            .navigationTitle("Favourites")
                            .navigationBarTitleDisplayMode(.large)
                            
                        }
                        
                        
                    }//: NAVIGATION
                    .navigationViewStyle(StackNavigationViewStyle())
                }
            }
            .popup(isPresented: $isShowingToast) {
                ToastView(title: self.networkStatus == .success ? "Internet Connected" : "Internet Connection Lost", networkStatus: self.$networkStatus)
            } customize: {
                $0
                    .autohideIn(4)
                    .appearFrom(.bottom)
            }
        }
        .onDisappear {
            self.isFirstCheckDone = true
        }

    }
    
    fileprivate func showToastOnConnectionStatus(status: NetworkStatus) -> some View {
        return Rectangle().fill(Color.clear).frame(height: 0)
            .onAppear {
                self.isShowingToast = true
                self.networkStatus = status
                self.isFirstCheckDone = true
            }
    }
}
