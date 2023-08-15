//
//  CustomNavigationBarView.swift
//  SparApp
//
//  Created by Никита Ясеник on 10.08.2023.
//

import SwiftUI

struct CustomNavigationBarView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(spacing: -10) {
            HStack {
                HStack(spacing: 0) {
                    Image("locationIcon")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .padding(.horizontal, 7)
                    Text("Нижний Новгород, Нижегородская область")
                        .font(.system(size: 15))
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 6)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke()
                        .fill(colorScheme == .dark ? .black : Color.gray.opacity(0.2))
                )
                Image(systemName: "line.3.horizontal")
                    .resizable()
                    .foregroundColor(.green)
                    .frame(width: 17, height: 13)
            }
            .padding()
            .background(colorScheme == .dark ? Color(red: 0.145, green: 0.145, blue: 0.157, opacity: 1).ignoresSafeArea() : Color.white.ignoresSafeArea())
            Divider()
                .overlay(colorScheme == .dark ? Color.black : Color.gray.opacity(0.2))
        }
        
        
    }
}

struct CustomLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.title
            .foregroundColor(.red) // Цвет текста
    }
}

struct CustomNavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBarView()
            .preferredColorScheme(.light)
    }
}
