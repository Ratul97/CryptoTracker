//
//  CoinInfoRowView.swift
//  CryptoTracker
//
//  Created by Kazi Shakawat Hossain Ratul on 26/10/25.
//

import SwiftUI

struct CoinInfoRowView: View {
    
    let coin: CoinModel
    
    var body: some View {
            HStack(spacing: 12) {
                Text("\(coin.rank)")
                    .font(.caption)
                    .foregroundStyle(Color.theme.secondaryText)
                
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(Color.theme.accent)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(coin.symbol.uppercased())
                        .font(.headline)
                    
                    Text(coin.name)
                        .font(.caption)
                        .foregroundStyle(Color.theme.secondaryText)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text(coin.currentPrice.asDecimalCurrency())
                        .font(.footnote.bold())
                    
                    HStack(spacing: 4) {
                        let isPositive = (coin.priceChange24H ?? 0) >= 0
                        Image(systemName: isPositive ? "chart.line.uptrend.xyaxis" : "chart.line.downtrend.xyaxis")
                            .foregroundStyle(isPositive ? Color.theme.green : Color.theme.red)
                        
                        Text(coin.priceChange24H?.asCurrencyWithPercent() ?? "0.00%")
                            .font(.caption)
                            .foregroundStyle(.white)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 8)
                            .background(isPositive ? Color.theme.green : Color.theme.red)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 6)
        }
}

struct CoinInfoRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinInfoRowView(coin: dev.coin)
    }
}
