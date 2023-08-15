//
//  MainView.swift
//  SparApp
//
//  Created by Никита Ясеник on 10.08.2023.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack {
                HeaderView()
                VStack(spacing: 15) {
                    StockView()
                    LoyaltyCardView()
                    HelpersView()
                    GoodsView()
                }
            }
        }
        .background(colorScheme == .dark ? Color(red: 0.145, green: 0.145, blue: 0.157, opacity: 1) : Color.white)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
