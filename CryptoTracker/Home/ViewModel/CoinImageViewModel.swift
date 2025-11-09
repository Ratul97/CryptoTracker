//
//  CoinImageViewModel.swift
//  CryptoTracker
//
//  Created by Kazi Shakawat Hossain Ratul on 10/11/25.
//

import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = true
    
    private var cancellables = Set<AnyCancellable>()
    
    init(imageURL: String) {
        fetchImage(imageURL: imageURL)
    }
    
    private func fetchImage(imageURL: String) {
        guard let url = URL(string: imageURL) else {
            isLoading = false
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .compactMap { UIImage(data: $0) }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    print("Image download failed: \(error.localizedDescription)")
                }
            } receiveValue: { [weak self] downloadedImage in
                self?.image = downloadedImage
            }
            .store(in: &cancellables)
    }
}
