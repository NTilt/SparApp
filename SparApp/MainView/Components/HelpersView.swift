//
//  HelpersView.swift
//  SparApp
//
//  Created by Никита Ясеник on 13.08.2023.
//

import SwiftUI

struct HelpersView: View {
    
    var texts: [String] = [
        "Абонемент на кофе",
        "Мои скидки",
        "Доставка за 1 час",
        "SPAR Wine",
        "Карта в подарок",
        "Списки покупок",
        "Доставка",
        "Закажи и забери",
        "Чат поддержки",
        "Мои адреса",
        "Магазины рядом"
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(texts.indices, id: \.self) { index in
                    HelperItem(text: texts[index])
                        .padding(.leading, index == 0 ? 16 : 0)
                        .padding(.trailing, index == texts.count - 1 ? 16 : 0)
                }
            }
        }
        
    }
}

struct HelperItem: View {
    
    var text: String
    
    var body: some View {
        VStack {
            Text(text)
                .font(.system(size: 14, weight: .semibold))
                .lineLimit(2)
                .padding(.vertical)
                .padding(.horizontal, 9)
            Spacer()
        }
        .frame(idealWidth: 100, minHeight: 120, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color.green.opacity(0.5))
        )
    }
    
}

struct HelpersView_Previews: PreviewProvider {
    static var previews: some View {
        HelpersView()
    }
}
