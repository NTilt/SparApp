//
//  StockView.swift
//  SparApp
//
//  Created by Никита Ясеник on 10.08.2023.
//

import SwiftUI

struct Banner: Identifiable, Hashable {
    var id = UUID().uuidString
    var image: String
}

struct StockView: View {
    @State private var banners: [Banner] = [
        Banner(image: "stock_5"),
        Banner(image: "stock_1"),
        Banner(image: "stock_2"),
        Banner(image: "stock_3"),
        Banner(image: "stock_4")
    ]
    
    @State private var colors: [Color] = [
        .red,
        .blue,
        .green,
        .yellow,
        .gray
    ]

    @State private var scrollOffset: CGFloat = 0
    @State private var dragOffset: CGFloat = 0
    @State private var positionX: CGFloat = -330
    private let widthCard: CGFloat = 360
    @State private var startPosition: CGFloat = .zero
    @State private var startTime: Date = Date()
    
    var body: some View {
        GeometryReader { proxy in
            HStack(spacing: 10) {
                ForEach(banners.indices, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color.clear)
                        .background(
                            Image(banners[index % banners.count].image)
                                .resizable()
                                .cornerRadius(20)
                        )
                        .frame(minWidth: 350, maxHeight: .infinity)
                        .cornerRadius(20)
                        .overlay (
                            GeometryReader { proxy1 in
                                Color.clear
                                    .preference(key: OffsetKey.self, value: proxy1.frame(in: .global).minX)
                                    .onAppear {
                                        if startPosition == .zero {
                                            startPosition = proxy1.frame(in: .global).minX
                                        }
                                    }
                            }
                        )
                        .offset(x: positionX)
        
                }
            }
            .offset(x: self.scrollOffset + self.dragOffset)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        withAnimation {
                            self.dragOffset = value.translation.width * 1.5
                        }
                    })
                    .onEnded({ value in
                        withAnimation {
                            self.scrollOffset += value.translation.width * 1.5
                            self.dragOffset = 0
                        }
                    })
            )
            .onPreferenceChange(OffsetKey.self, perform: { min in
                if min < startPosition - 2 * widthCard {

                    positionX += widthCard
                    let old = banners.remove(at: 0)
                    banners.append(old)
                }
                if min > startPosition + widthCard  {
                    let old = banners.remove(at: banners.count - 1)
                    banners.insert(old, at: 0)
                    positionX -= widthCard
                }
            })

        }
        .frame(height: 180)
    }
}

struct OffsetKey: PreferenceKey {
    
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
    
}

struct StockView_Previews: PreviewProvider {
    static var previews: some View {
        StockView()
    }
}


//Image(banners[index].image)
//    .resizable()
//    .scaledToFill()
