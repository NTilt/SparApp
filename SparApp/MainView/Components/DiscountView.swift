//
//  DiscountView.swift
//  SparApp
//
//  Created by Никита Ясеник on 14.08.2023.
//

import SwiftUI

struct DiscountView: View {
    
    var discount: Int
    
    var body: some View {
        Text("\(discount)%")
            .font(.system(size: 15))
            .fontWeight(.bold)
            .foregroundColor(.red)
            .padding(6)
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(.white.opacity(0.7))
            )
    }
}
