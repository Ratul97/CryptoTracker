//
//  CircularButtonAnimationView.swift
//  CryptoTracker
//
//  Created by Kazi Shakawat Hossain Ratul on 20/10/25.
//

import SwiftUI

struct CircularButtonAnimationView: View {
    
    @Binding var animated: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 4)
            .scaleEffect(animated ? 1.0 : 0.0)
            .opacity(animated ? 0.0 : 1.0)
            .animation(.easeInOut(duration: 1.0), value: animated)
            .foregroundStyle(Color.theme.accent)
    }
}

#Preview {
    CircularButtonAnimationView(animated: .constant(false))
}
