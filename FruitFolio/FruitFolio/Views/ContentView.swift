//
//  ContentView.swift
//  FruitFolio
//
//  Created by Hamza Azhar on 10/10/2023.
//

import SwiftUI
import PopupView

enum Category {
    case fruits
    case vegetables
}

struct ContentView: View {
    
    @State var isShowingToast: Bool = false
    @ObservedObject var favouriteManager: FavouriteManager
    let backgroundColor = Color(hex: "#f2f2f7")
    var fruits: [Fruit] = fruitsData
    var vegetables: [Vegetable] = vegetablesData
    @State private var isShowingSettings: Bool = false
    @State private var category: Category = .fruits
    @State private var searchText: String = ""
    @ObservedObject var networkManager: ConnectionManager
    @State private var networkStatus: NetworkStatus = .success
    @State private var isFirstCheckDone: Bool = false
    
    var filteredFruits: [Fruit] {
        if searchText.isEmpty {
            return fruits
        } else {
            return fruits.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var filteredVegetables: [Vegetable] {
        if searchText.isEmpty {
            return vegetables
        } else {
            return vegetables.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                switch self.networkManager.isConnected {
                case true:
                    if isFirstCheckDone {
                        self.showToastOnConnectionStatus(status: .success)
                    }
                case false:
                    self.showToastOnConnectionStatus(status: .failure)
                }
                
                
                
                Picker("", selection: $category) {
                    Text("Fruits").tag(Category.fruits)
                    Text("Vegetables").tag(Category.vegetables)
                }
                .frame(width: 200)
                .pickerStyle(.segmented)
                .padding(10)
                
                SearchBarView(searchText: $searchText)
                    .padding(.horizontal, 20)
                
                
                switch category {
                case .fruits:
                    List {
                        ForEach(self.filteredFruits) { item in
                            NavigationLink(destination: FruitDetailView(fruit: item, favouriteManager: self.favouriteManager)) {
                                FruitRowView(fruit: item)
                                    .padding(.vertical, 4)
                                
                            }
                            
                        }.background(.clear)
                    }//: LIST
                    .navigationTitle("Fruits")
                    .navigationBarTitleDisplayMode(.large)
                case .vegetables:
                    List {
                        ForEach(self.filteredVegetables) { item in
                            NavigationLink(destination: VegetableDetailView(vegetable: item, favouriteManager: self.favouriteManager)) {
                                VegetableRowView(vegetable: item)
                                    .padding(.vertical, 4)
                                
                            }
                        }.background(.clear)
                    }//: LIST
                    .navigationTitle("Vegetables")
                    .navigationBarTitleDisplayMode(.large)
                    
                }
            }
            .background(backgroundColor)
            .popup(isPresented: $isShowingToast) {
                ToastView(title: self.networkStatus == .success ? "Internet Connected" : "Internet Connection Lost", networkStatus: self.$networkStatus)
            } customize: {
                $0
                    .autohideIn(4)
                    .appearFrom(.bottom)
            }
        }//: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    fileprivate func showToastOnConnectionStatus(status: NetworkStatus) -> some View {
        return Rectangle().fill(Color.clear).frame(height: 0)
            .onAppear {
                self.isShowingToast = true
                self.isFirstCheckDone = true
                self.networkStatus = status
            }
    }
}
