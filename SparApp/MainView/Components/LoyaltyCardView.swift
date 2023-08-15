//
//  LoyaltyCardView.swift
//  SparApp
//
//  Created by Никита Ясеник on 13.08.2023.
//

import SwiftUI

struct LoyaltyCardView: View {
    var body: some View {
        HStack {
            VStack {
                HStack(alignment: .lastTextBaseline) {
                    Text("\(180)")
                        .font(.system(size: 30, weight: .bold))
                    Text("бонусов")
                        .frame(alignment: .bottom)
                        .font(.system(size: 15, weight: .bold))
                }
                Spacer()
            }
            .padding()
            
            Spacer()
            Image("hh_1")
                .resizable()
                .scaledToFit()
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color.white)
                )
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: 120)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.green.opacity(0.5))
        )
        .padding(.horizontal)
        
        
    }
}

struct LoyaltyCardView_Previews: PreviewProvider {
    static var previews: some View {
        LoyaltyCardView()
    }
}
