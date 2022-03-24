//
//  WelcomeView.swift
//  SimplyGoat
//
//  Created by Swaye Chateau on 24/03/2022.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.white.opacity(0.5)
                .frame(width: 300, height: 400)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
                .blur(radius: 1)
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Welcome to Goats")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .frame(maxWidth: .infinity, alignment: .center)
                AsyncImage(url: URL(string: "https://a.omappapi.com/users/851fcae80207/images/1dc843ce17381646950227-goats.jpg"))
                    .clipShape(Circle())
                    .padding(.vertical, 7.0)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: .infinity, height: 250.0, alignment: .center)
      

            
                
                Text("If a goat eats office supplies...".uppercased())
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text("Does that mean they're on a staple diet?")
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding()
            .frame(width: 300, height: 400)
            .foregroundColor(Color.black.opacity(0.8))
            
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
