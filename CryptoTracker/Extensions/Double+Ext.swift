//
//  Double+Ext.swift
//  CryptoTracker
//
//  Created by Kazi Shakawat Hossain Ratul on 26/10/25.
//

import Foundation

extension Double {
    private var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencySymbol = "$"
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.locale = Locale(identifier: "en_US")
        return numberFormatter
    }
    
    func asDecimalCurrency() -> String {
        let number = NSNumber(value: self)
        return numberFormatter.string(from: number) ?? "$0.00"
    }
    
    func asCurrencyWithPercent() -> String {
        return String(format: "%.2f%%", self)
    }
}
