//
//  HomeViewModel.swift
//  CryptoTracker
//
//  Created by Kazi Shakawat Hossain Ratul on 27/10/25.
//

import Combine

class HomeViewModel: ObservableObject {
    @Published var coins : [CoinModel] = []

    
    init() {
        self.coins.append(DeveloperPreview.instance.coin)
    }
}
