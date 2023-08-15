//
//  CustomNavigationBarContainer.swift
//  SparApp
//
//  Created by Никита Ясеник on 10.08.2023.
//

import SwiftUI

struct CustomNavigationBarContainer<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBarView()
            content
        }
        .navigationBarHidden(true)
    }
    
}

struct CustomNavigationBarContainer_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBarContainer {
            Text("asd")
        }
    }
}
