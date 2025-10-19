//
//  HomeView.swift
//  CryptoTracker
//
//  Created by Kazi Shakawat Hossain Ratul on 19/10/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showCryptoList: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                VStack {
                    headerView
                    
                    Spacer()
                }
            }
            .toolbar(.hidden)
        }
    }
    
    private var headerView: some View {
        HStack {
            CircularButtonView(imageName: showCryptoList ?  "info.bubble.fill" : "plus")
                .animation(.easeInOut, value: showCryptoList)
                .background(
                    CircularButtonAnimationView(animated: $showCryptoList)
                )
            
            Spacer()
            
            Text(showCryptoList ? "Portpholio" : "Live Update")
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
                .animation(.easeInOut, value: showCryptoList)
            
            Spacer()
            
            CircularButtonView(imageName: "chevron.right")
                .rotationEffect(showCryptoList ? Angle(degrees: 180.0) : Angle(degrees: 0.0))
                .animation(.easeInOut, value: showCryptoList)
                
                .onTapGesture {
                    showCryptoList.toggle()
                }
        }
        .padding(.horizontal)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .toolbar(.hidden)
    }
}
