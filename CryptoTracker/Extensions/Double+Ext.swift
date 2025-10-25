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
        numberFormatter.minimumIntegerDigits = 0
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }
    
    func asDecimalCurrency() -> String {
        let number = NSNumber(value: self)
        return numberFormatter.string(from: number) ?? "0.00"
    }
    
    func asCurrencyWithPercent() -> String {
        return String(format: "%.2f%%", self)
    }
}
