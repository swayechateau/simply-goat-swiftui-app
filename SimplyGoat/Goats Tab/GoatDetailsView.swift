//
//  GoatDetailsView.swift
//  SimplyGoat
//
//  Created by Swaye Chateau on 24/03/2022.
//

import SwiftUI

struct GoatDetailsView: View {
    let goat: Goat
    @State var isLiked = false;
    var body: some View {
        VStack{
            Text(goat.name)
            AsyncImage(url:URL(string:goat.image))
            Text(goat.fun_fact)
            Spacer()
            LikeButton(isLiked: $isLiked)
        }
    }
}

struct GoatDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        GoatDetailsView(goat: .init(id: 1, name: "apex", image: "https://a-z-animals.com/media/2021/05/American-Pygmy-Goat-in-enclosure-768x401.jpg", likes: 0, fun_fact: "likes to sprint"))
    }
}
