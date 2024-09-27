//
//  ContentView.swift
//  Matchbox
//
//  Created by kai on 3/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeScreen()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
//            MessagesScreen()
//                .tabItem{
//                    Label("Post", systemImage: "plus")
//                }
            
        }
        .padding()
    }
    }

#Preview {
    ContentView()
//        .environmentObject(Network())
}
