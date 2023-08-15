//
//  UnitView.swift
//  SparApp
//
//  Created by Никита Ясеник on 14.08.2023.
//

import SwiftUI

enum Currency {
    case rub
    case usd
}

struct UnitView: View {
    
    var currency: Currency
    var unitMeasurement: UnitMeasurement
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        GeometryReader { geo in
            VStack {
                HStack(alignment: .top) {
                    Text( currency == .rub ? "\u{20BD}" : "$")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(colorScheme == .dark ? .white : Color(red: 0.145, green: 0.145, blue: 0.157, opacity: 1))
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text(unitMeasurement == .gr ? "гр" : "шт")
                        .font(.system(size: 8, weight: .bold))
                        .foregroundColor(colorScheme == .dark ? .white : Color(red: 0.145, green: 0.145, blue: 0.157, opacity: 1))
                }
            }
            .overlay (
                Path { path in
                    let width = geo.size.width
                    let height = geo.size.height
                    path.move(to: CGPoint(x: 3, y: height - 3))
                    path.addLine(to: CGPoint(x: width - 4, y: 4))
                    path.closeSubpath()
                }
                    .stroke(colorScheme == .dark ? .white : .black, lineWidth: 1)
                )
            }
            .frame(width: 20, height: 20)
    }
}

struct UnitView_Previews: PreviewProvider {
    static var previews: some View {
        UnitView(currency: .rub, unitMeasurement: .pc)
    }
}
