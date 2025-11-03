//
//  HomeViewModel.swift
//  CryptoTracker
//
//  Created by Kazi Shakawat Hossain Ratul on 27/10/25.
//

import Combine
import Foundation

class HomeViewModel: ObservableObject {
    private let coinService = CoinService.shared
    @Published var coins : [CoinModel] = []

    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        fetchCoins()
    }
    
    private func fetchCoins() {
        coinService.fetchCoins()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            }, receiveValue: { [weak self] coins in
                self?.coins = coins
            })
            .store(in: &cancellables)
    }
}
