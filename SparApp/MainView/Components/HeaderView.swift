//
//  HeaderView.swift
//  SparApp
//
//  Created by Никита Ясеник on 10.08.2023.
//

import SwiftUI
import UIKit

struct HeaderView: View {
    
    @State private var headers: [HeaderItemModel] = [
        HeaderItemModel(text: "Привилегии \u{00AB}Мой SPAR\u{00BB}"),
        HeaderItemModel(text: "Мы в соцсетях", image: "telegramImage"),
        HeaderItemModel(text: "Рецепт недели", image: "dishImage"),
        HeaderItemModel(text: "Привилегии \u{00AB}Мой SPAR\u{00BB}"),
        HeaderItemModel(text: "Мы в соцсетях", image: "telegramImage"),
        HeaderItemModel(text: "Рецепт недели", image: "dishImage"),
        HeaderItemModel(text: "Привилегии \u{00AB}Мой SPAR\u{00BB}"),
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 13) {
                ForEach(headers.indices, id: \.self) { index in
                    HeaderItem(header: headers[index])
                }
            }
            .padding()
        }
    }
}

struct HeaderItem: View {
    
    var header: HeaderItemModel
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            if header.image == nil {
                MyIcon()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.green)
                    .padding(4)
                    .background(
                        Circle()
                            .stroke(lineWidth: 2)
                            .fill(Color.green)
                    )
            }
            else {
                Image(header.image!)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                    .padding(4)
                    .background(
                        Circle()
                            .stroke(lineWidth: 2)
                            .fill(Color.green)
                    )
            }
            Text(header.text)
                .font(.system(size: 11))
                .foregroundColor(colorScheme == .dark ? .white:   Color(red: 0.145, green: 0.145, blue: 0.157, opacity: 1))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: 70)
        
    }
}

struct HeaderItemModel {
    var text: String
    var image: String?
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}

struct MyIcon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.49823*width, y: 0))
        path.addCurve(to: CGPoint(x: 0, y: 0.51301*height), control1: CGPoint(x: 0.21908*width, y: 0), control2: CGPoint(x: 0, y: 0.22677*height))
        path.addCurve(to: CGPoint(x: 0.25088*width, y: 0.94424*height), control1: CGPoint(x: 0, y: 0.69889*height), control2: CGPoint(x: 0.08834*width, y: 0.86245*height))
        path.addCurve(to: CGPoint(x: 0.74912*width, y: 0.94424*height), control1: CGPoint(x: 0.39929*width, y: 1.01859*height), control2: CGPoint(x: 0.60071*width, y: 1.01859*height))
        path.addCurve(to: CGPoint(x: width, y: 0.51301*height), control1: CGPoint(x: 0.89753*width, y: 0.86989*height), control2: CGPoint(x: width, y: 0.69889*height))
        path.addCurve(to: CGPoint(x: 0.49823*width, y: 0), control1: CGPoint(x: 0.99647*width, y: 0.23048*height), control2: CGPoint(x: 0.77738*width, y: 0))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.83392*width, y: 0.72863*height))
        path.addCurve(to: CGPoint(x: 0.63251*width, y: 0.8513*height), control1: CGPoint(x: 0.78092*width, y: 0.81784*height), control2: CGPoint(x: 0.69611*width, y: 0.8513*height))
        path.addCurve(to: CGPoint(x: 0.5477*width, y: 0.76208*height), control1: CGPoint(x: 0.58657*width, y: 0.8513*height), control2: CGPoint(x: 0.5477*width, y: 0.81784*height))
        path.addLine(to: CGPoint(x: 0.5477*width, y: 0.68773*height))
        path.addLine(to: CGPoint(x: 0.80919*width, y: 0.68773*height))
        path.addCurve(to: CGPoint(x: 0.49823*width, y: 0.13011*height), control1: CGPoint(x: 0.69611*width, y: 0.56134*height), control2: CGPoint(x: 0.5477*width, y: 0.30483*height))
        path.addCurve(to: CGPoint(x: 0.19081*width, y: 0.68773*height), control1: CGPoint(x: 0.44876*width, y: 0.30483*height), control2: CGPoint(x: 0.30035*width, y: 0.56134*height))
        path.addLine(to: CGPoint(x: 0.44876*width, y: 0.68773*height))
        path.addLine(to: CGPoint(x: 0.44876*width, y: 0.7658*height))
        path.addCurve(to: CGPoint(x: 0.36749*width, y: 0.8513*height), control1: CGPoint(x: 0.44876*width, y: 0.80669*height), control2: CGPoint(x: 0.41343*width, y: 0.85502*height))
        path.addCurve(to: CGPoint(x: 0.16608*width, y: 0.72863*height), control1: CGPoint(x: 0.30035*width, y: 0.8513*height), control2: CGPoint(x: 0.21555*width, y: 0.81784*height))
        path.addCurve(to: CGPoint(x: 0.10247*width, y: 0.5093*height), control1: CGPoint(x: 0.13074*width, y: 0.66171*height), control2: CGPoint(x: 0.10247*width, y: 0.61338*height))
        path.addCurve(to: CGPoint(x: 0.50177*width, y: 0.10037*height), control1: CGPoint(x: 0.10247*width, y: 0.28625*height), control2: CGPoint(x: 0.27915*width, y: 0.10037*height))
        path.addCurve(to: CGPoint(x: 0.90106*width, y: 0.5093*height), control1: CGPoint(x: 0.72438*width, y: 0.10037*height), control2: CGPoint(x: 0.90106*width, y: 0.28996*height))
        path.addCurve(to: CGPoint(x: 0.83392*width, y: 0.72863*height), control1: CGPoint(x: 0.89753*width, y: 0.61338*height), control2: CGPoint(x: 0.85159*width, y: 0.7026*height))
        path.closeSubpath()
        return path
    }
}
