//
//  GoatListView.swift
//  SimplyGoat
//
//  Created by Swaye Chateau on 24/03/2022.
//

import SwiftUI

struct GoatListView: View {
    @State var goats = [Goat]()
    
    var body: some View {
        List(goats, id: \.self.id) { goat in
            NavigationLink(
                destination: GoatDetailsView(goat: goat), label: {
                    Text(goat.name)
                })
        }
        .onAppear() {
            apiCall().getGoats { (goats) in
                self.goats = goats
            }
        }.navigationTitle("Goats")
    }
}

struct GoatListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GoatListView()
        }
    }
}
