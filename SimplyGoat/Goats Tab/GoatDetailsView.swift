//
//  GoatDetailsView.swift
//  SimplyGoat
//
//  Created by Swaye Chateau on 24/03/2022.
//

import SwiftUI

struct GoatDetailsView: View {
    let goat: Goat
    // @State var isLiked = false;
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.white.opacity(0.5)
                .frame(width: 300, height: 400)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
                .blur(radius: 1)
            VStack (alignment: .leading, spacing: 16){
                Text(goat.name.uppercased())
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .frame(maxWidth: .infinity, alignment: .center)
                AsyncImage(
                    url:URL(string:goat.image),
                    content: { image in
                        image.resizable()
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fit)
                            .frame(width: .infinity, height: 250.0, alignment: .center)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                 
                Spacer()
                Text(goat.fun_fact).font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .center)
                
            }.padding()
                .frame(width: 300, height: 400)
                .foregroundColor(Color.black.opacity(0.8))
            VStack (alignment: .leading, spacing: 16) {
                // LikeButton(isLiked: $isLiked)
            }
        }
    }
}

struct GoatDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        GoatDetailsView(goat: .init(id: 1, name: "apex", image: "https://a-z-animals.com/media/2021/05/American-Pygmy-Goat-in-enclosure-768x401.jpg", likes: 0, fun_fact: "likes to sprint"))
    }
}
