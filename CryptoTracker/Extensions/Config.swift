//
//  Config.swift
//  CryptoTracker
//
//  Created by Kazi Shakawat Hossain Ratul on 2/11/25.
//

import Foundation

struct Config {
    static var apiKey: String {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "COIN_API_KEY") as? String else {
            fatalError("COIN_API_KEY not found in Info.plist")
        }
        return apiKey
    }
}
