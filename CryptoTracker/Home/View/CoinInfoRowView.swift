//
//  CoinInfoRowView.swift
//  CryptoTracker
//
//  Created by Kazi Shakawat Hossain Ratul on 26/10/25.
//

import SwiftUI

struct CoinInfoRowView: View {
    
    let coin: CoinModel
    let showCurrentHolding: Bool
    
    var body: some View {
        HStack {
            coinRankView
            
            CoinImageView(imageURL: coin.image)
                .frame(width: 20, height: 20)
            
            coinNameView
            
            Spacer()
            
            if showCurrentHolding {
                coinHoldingView
            }
            
            Spacer()
            
            coinPriceView
        }
        .padding(.horizontal)
        .padding(.vertical, 6)
    }
    
    private var coinRankView: some View {
        Text("\(coin.rank)")
            .font(.caption)
            .foregroundStyle(Color.theme.secondaryText)
    }
    
    private var coinNameView: some View {
        VStack(alignment: .leading) {
            Text(coin.symbol.uppercased())
                .font(.headline)
            
            Text(coin.name)
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
        }
    }
    
    private var coinHoldingView: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asDecimalCurrency())
                .font(.footnote.bold())
            
            Text(coin.currentHoldings?.asCurrencyWithPercent() ?? "0.00%")
                .font(.caption)
        }
    }
    
    private var coinPriceView: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asDecimalCurrency())
                .font(.footnote.bold())
            
            HStack() {
                let isPositive = (coin.priceChange24H ?? 0) >= 0
                Image(systemName: isPositive ? "chart.line.uptrend.xyaxis" : "chart.line.downtrend.xyaxis")
                    .foregroundStyle(isPositive ? Color.theme.tagBackground : Color.theme.red)
                
                Text(coin.priceChange24H?.asCurrencyWithPercent() ?? "0.00%")
                    .font(.caption)
                    .foregroundStyle(Color.theme.tagText)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 8)
                    .background(isPositive ? Color.theme.tagBackground : Color.theme.red)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
    }
}

struct CoinInfoRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinInfoRowView(coin: dev.coin, showCurrentHolding: true)
    }
}
