//
//  ContentView.swift
//  SimplyGoat
//
//  Created by Swaye Chateau on 24/03/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MainView()
            .tabItem {
                Text("Main Screen")
                    .font(.system(size: 26))
            }
            .tag(0)
            
            GoatListView()
                .tabItem {
                    Text("Goat List")
                        .font(.system(size: 26))
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}
