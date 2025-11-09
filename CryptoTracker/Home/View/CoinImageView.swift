//
//  CoinImageView.swift
//  CryptoTracker
//
//  Created by Kazi Shakawat Hossain Ratul on 10/11/25.
//

import SwiftUI

struct CoinImageView: View {
    private let imageURL: String
    @StateObject var viewModel: CoinImageViewModel
    
    init(imageURL: String) {
        self.imageURL = imageURL
        _viewModel = StateObject(wrappedValue: CoinImageViewModel(imageURL: imageURL))
    }
    
    var body: some View {
        if let image = viewModel.image {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
        } else if viewModel.isLoading {
            ProgressView()
        } else {
            Image(systemName: "photo.circle")
        }
    }
}

#Preview {
    CoinImageView(imageURL: "")
}
