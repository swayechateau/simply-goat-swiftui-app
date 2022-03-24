//
//  StaticGoatList.swift
//  SimplyGoat
//
//  Created by Swaye Chateau on 24/03/2022.
//

import SwiftUI

struct StaticGoatList: View {
    @State var goats: [Goat] = [
        .init(id: 1, name: "apex", image: "https://a-z-animals.com/media/2021/05/American-Pygmy-Goat-in-enclosure-768x401.jpg", likes: 0, fun_fact: "likes to sprint")
    ]
    
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            List(goats, id: \.self.id) { goat in
                NavigationLink(
                    destination: GoatDetailsView(goat: goat), label: {
                        Text(goat.name)
                    })
            }.onAppear(){
                
            }.navigationTitle("Goats")
        }
    }
}

struct StaticGoatList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            StaticGoatList()
        }
    }
}


