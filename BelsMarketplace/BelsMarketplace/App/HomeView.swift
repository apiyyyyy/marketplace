//
//  HomeView.swift
//  BelsMarketplace
//
//  Created by MOHAMMADB on 09/09/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, content: {
                    Text("Placeholder")
                        .padding()
                        .foregroundStyle(.white)
                
                }) // VStack
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } // ScrollView
            .background(Color.background) // Apply the background here
        } // NavigationStack
        .background(Color.background.edgesIgnoringSafeArea(.all)) // Also apply to NavigationStack and extend to safe areas
    }
}

#Preview {
    HomeView()
}
