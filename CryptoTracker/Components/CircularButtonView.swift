//
//  CircularButtonView.swift
//  CryptoTracker
//
//  Created by Kazi Shakawat Hossain Ratul on 19/10/25.
//

import SwiftUI

struct CircularButtonView: View {
    
    let imageName: String
    
    var body: some View {
        Image(systemName: imageName)
            .font(.body)
            .foregroundStyle(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .fill(Color.theme.background)
            )
            .shadow(color: Color.theme.accent.opacity(0.3), radius: 10, x: 0.0, y: 3.0)
            .padding()
            
    }
}

struct CircularButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CircularButtonView(imageName: "info")
    }
}
