//
//  SearchBarView.swift
//  FruitFolio
//
//  Created by Hamza Azhar on 26/11/2023.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search", text: $searchText)
                .foregroundColor(.primary)
            if !searchText.isEmpty {
                Button(action: {
                    searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.primary)
                }
            }
        }
        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
        .background(Color.secondary.opacity(0.1))
        .cornerRadius(10.0)
    }
}
