//
//  HomeView.swift
//  CryptoTracker
//
//  Created by Kazi Shakawat Hossain Ratul on 19/10/25.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                VStack {
                    headerView
                    
                    titleView
                    
                    if !showPortfolio {
                        coinListView
                    } else {
                        coinHoldingListView
                    }
                    
                    Spacer()
                }
            }
            .toolbar(.hidden)
        }
        .onAppear {
            CoinService.shared
        }
    }
    
    private var headerView: some View {
        HStack {
            CircularButtonView(imageName: showPortfolio ?  "info.bubble.fill" : "plus")
                .animation(.easeInOut, value: showPortfolio)
                .background(
                    CircularButtonAnimationView(animated: $showPortfolio)
                )
            
            Spacer()
            
            Text(showPortfolio ? "Portpholio" : "Live Update")
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
                .animation(.easeInOut, value: showPortfolio)
            
            Spacer()
            
            CircularButtonView(imageName: "chevron.right")
                .rotationEffect(showPortfolio ? Angle(degrees: 180.0) : Angle(degrees: 0.0))
                .animation(.easeInOut, value: showPortfolio)
                
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var titleView: some View {
        HStack {
            Text("Coin")
            Spacer()
            if showPortfolio {
                Text("Holding")
            }
            
            Spacer()
            Text("Statistics")
        }
        .padding(.horizontal, 20)
        .font(.caption.bold())
    }
    
    private var coinListView: some View {
        List {
            ForEach(viewModel.coins) { coin in
                CoinInfoRowView(coin: coin, showCurrentHolding: false)
                    .listRowInsets(EdgeInsets(top: 5.0, leading: 0.0, bottom: 5.0, trailing: 0.0))
            }
        }
        .listStyle(.plain)
        .transition(.move(edge: .leading))
    }
    
    private var coinHoldingListView: some View {
        List {
            ForEach(viewModel.coins) { coin in
                CoinInfoRowView(coin: coin, showCurrentHolding: true)
                    .listRowInsets(EdgeInsets(top: 5.0, leading: 0.0, bottom: 5.0, trailing: 0.0))
            }
        }
        .listStyle(.plain)
        .transition(.move(edge: .trailing))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HomeViewModel())
    }
}
