//
//  CustomShapeView.swift
//  SparApp
//
//  Created by Никита Ясеник on 14.08.2023.
//

import SwiftUI

struct CustomShapeView: View {
    var promotion: Promotion
    var text: String {
        switch promotion {
        case .cardPrice:
             return "Цена по карте"
        case .new:
            return "Новинка"
        case .superPrice:
            return "Супер Цена"
        }
    }
    
    var color: Color {
        switch promotion {
        case .cardPrice:
            return .green
        case .new:
            return .purple
        case .superPrice:
            return .red
        }
    }
    var body: some View {
        Text(text)
            .font(.system(size: 7, weight: .bold))
            .foregroundColor(.white)
            .padding(.vertical, 5)
            .padding(.horizontal, 8)
            .frame(minWidth: 60)
            .background(
                CustomIcon()
                    .fill(color.opacity(0.6))
            )
    }
}

struct CustomIcon: Shape {
    func path(in rect: CGRect) -> Path {
            var path = Path()
            let width = rect.size.width
            let height = rect.size.height
            path.move(to: CGPoint(x: 0.30481*width, y: 0))
            path.addCurve(to: CGPoint(x: 0.92306*width, y: 0), control1: CGPoint(x: 0.57354*width, y: 0), control2: CGPoint(x: 0.68547*width, y: 0))
            path.addCurve(to: CGPoint(x: width, y: 0.25157*height), control1: CGPoint(x: 0.96554*width, y: 0), control2: CGPoint(x: width, y: 0.11263*height))
            path.addLine(to: CGPoint(x: width, y: 0.74843*height))
            path.addCurve(to: CGPoint(x: 0.92355*width, y: height), control1: CGPoint(x: width, y: 0.88736*height), control2: CGPoint(x: 0.96603*width, y: height))
            path.addCurve(to: CGPoint(x: 0.00481*width, y: height), control1: CGPoint(x: 0.69308*width, y: height), control2: CGPoint(x: 0.01994*width, y: height))
            path.addCurve(to: CGPoint(x: 0.30481*width, y: 0), control1: CGPoint(x: -0.01346*width, y: height), control2: CGPoint(x: 0.00865*width, y: 0))
            path.closeSubpath()
            return path
        }
}
