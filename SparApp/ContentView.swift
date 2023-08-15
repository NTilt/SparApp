//
//  ContentView.swift
//  SparApp
//
//  Created by Никита Ясеник on 10.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        CustomNavigationBarContainer {
            VStack(spacing: 0) {
                TabView {
                    MainView()
                        .tabItem {
                            Image("tabMain")
                            Text("Главная")
                        }
                    
                    Text("Second Tab")
                        .tabItem {
                            Image("tabCatalog")
                                .renderingMode(.template)
                            Text("Каталог")
                        }
                    
                    Text("Third Tab")
                        .tabItem {
                            Image("tabCart")
                                .renderingMode(.template)
                            Text("Корзина")
                        }
                    Text("Four Tab")
                        .tabItem {
                            Image("tabProfile")
                                .renderingMode(.template)
                            Text("Профиль")
                        }
                }
                .onAppear {
                    UITabBar.appearance().backgroundColor = colorScheme == .dark ? UIColor(red: 0.145, green: 0.145, blue: 0.157, alpha: 1) : UIColor.white
                }
                .accentColor(.green)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
