//
//  CoinService.swift
//  CryptoTracker
//
//  Created by Kazi Shakawat Hossain Ratul on 30/10/25.
//

import Combine
import Foundation

class CoinService {
    static let shared = CoinService()
    @Published var coinData: [CoinModel] = []
    private var coinSubscription: AnyCancellable?
    
    private let APIKey = Config.apiKey
    
    private init() {
        getCoins()
    }
    
    private func getCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=bitcoin&names=Bitcoin&symbols=btc&category=layer-1&price_change_percentage=1h&sparkline=true?x_cg_demo_api_key=\(APIKey)")
        else {
            print("Invalid URL")
            return
        }
        
        coinSubscription =  URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global())
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                200..<300 ~= httpResponse.statusCode else {
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Failed to fetch coins: \(error)")
                }
            }, receiveValue: {
                self.coinData = $0
                self.coinSubscription?.cancel()
            })
    }
}
