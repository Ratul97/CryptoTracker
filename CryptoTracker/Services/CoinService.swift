////
////  CoinService.swift
////  CryptoTracker
////
////  Created by Kazi Shakawat Hossain Ratul on 30/10/25.
////
//

import Foundation
import Combine

protocol CoinServiceable {
    func fetchCoins() -> AnyPublisher<[CoinModel], NetworkError>
}

class CoinService: CoinServiceable {
    
    static var shared = CoinService()
    private let networkRequest: NetworkServiceProtocol
    
    init(networkRequest: NetworkServiceProtocol = NetworkService()) {
        self.networkRequest = networkRequest
    }
    
    func fetchCoins() -> AnyPublisher<[CoinModel], NetworkError> {
        let endpoint = RequestEndpoints.fetchCoins
        let request = endpoint.createRequest()
        return self.networkRequest.request(request)
    }
}
