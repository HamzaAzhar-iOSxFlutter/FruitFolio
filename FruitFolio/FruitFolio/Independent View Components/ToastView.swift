//
//  ToastView.swift
//  FruitFolio
//
//  Created by Hamza Azhar on 09/12/2023.
//

import SwiftUI

enum NetworkStatus: String {
    case success = "success"
    case failure = "failure"
}

struct ToastView: View {
    var title: String
    @Binding var networkStatus: NetworkStatus
    
    var body: some View {
        ZStack {
            HStack(alignment: .center) {
                Image(self.networkStatus == .success ? self.networkStatus.rawValue : self.networkStatus.rawValue).resizable().scaledToFill().frame(width: 15, height: 15)
                Text(title)
            }
        }
        .frame(width: 300, height: 39, alignment: .center)
        .cornerRadius(4)
        .background(Color.white.cornerRadius(4).shadow(radius: 4))
    }
}
