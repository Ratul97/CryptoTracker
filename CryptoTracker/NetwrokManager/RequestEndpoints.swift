//
//  RequestEndpoints.swift
//  CryptoTracker
//
//  Created by Kazi Shakawat Hossain Ratul on 4/11/25.
//

public typealias Headers = [String: String]

enum RequestEndpoints {
    
    case fetchCoins
    
    var requestTimeOut: Int {
        return 20
    }
    
    private var APIKey: String { return Config.apiKey }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .fetchCoins:
            return .GET
        }
    }
    
    func createRequest() -> NetworkRequest {
        //        var headers: Headers = [:]
        //        headers["Content-Type"] = "application/json"
        //        headers["Authorization"] = "Bearer \(token)"
        return NetworkRequest(url: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=bitcoin&names=Bitcoin&symbols=btc&category=layer-1&price_change_percentage=1h&sparkline=true?x_cg_demo_api_key=\(APIKey)", headers: [:], reqBody: requestBody, httpMethod: httpMethod)
    }
    
    var requestBody: Encodable? {
        switch self {
        default:
            return nil
        }
    }
}
