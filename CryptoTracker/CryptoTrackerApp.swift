//
//  CryptoTrackerApp.swift
//  CryptoTracker
//
//  Created by Kazi Shakawat Hossain Ratul on 19/10/25.
//

import SwiftUI

@main
struct CryptoTrackerApp: App {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(viewModel)
        }
    }
}
