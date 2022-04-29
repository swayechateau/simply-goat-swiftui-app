//
//  GoatListView.swift
//  SimplyGoat
//
//  Created by Swaye Chateau on 24/03/2022.
//

import SwiftUI

struct GoatListView: View {
    @ObservedObject var goatsListViewModel = GoatListViewModel()
    var body: some View {
        NavigationView{
            List(goatsListViewModel.goats, id: \.id) { goat in
                NavigationLink(
                    destination: GoatDetailsView(goat: goat), label: {
                        Image(systemName: goat.isLiked ? "heart.fill" : "")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                            .foregroundColor(goat.isLiked ? .red : .gray)
                        Text(goat.name)
                    })
            }
            .onAppear() {
                goatsListViewModel.fetchGoats()
            }.navigationTitle("Goats")
        }
    }
}

struct GoatListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GoatListView()
        }
    }
}
