//
//  LikeButton.swift
//  SimplyGoat
//
//  Created by Swaye Chateau on 24/03/2022.
//

import SwiftUI

struct LikeButton: View {
    @Binding var isLiked: Bool
    var body: some View{
        Button(action: {
            self.isLiked.toggle()
        }, label: {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .foregroundColor(isLiked ? .red : .gray)
        })
    }
}

