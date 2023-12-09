//
//  ConnectionManager.swift
//  FruitFolio
//
//  Created by Hamza Azhar on 09/12/2023.
//

import Foundation

import Foundation
import Network

class ConnectionManager: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "NetworkManager")
    @Published var isConnected = true
    
    var connectionDescription: String {
        if self.isConnected {
            return "Connected to internet"
        } else {
            return "No Internet Connection"
        }
    }
    
    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async { [weak self] in
                self?.isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
    }
}
