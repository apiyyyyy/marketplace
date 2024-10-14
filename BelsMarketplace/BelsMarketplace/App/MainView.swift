//
//  MainView.swift
//  BelsMarketplace
//
//  Created by MOHAMMADB on 09/09/24.
//

import SwiftUI
import Foundation

struct MainView: View {
    
    
    init() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor.darkGrey
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.white
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            LikesView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Likes")
                }
            CartsView()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Carts")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }

        }// Tab
    }
}


#Preview {
    MainView()
}
