//
//  GoatModel.swift
//  SimplyGoat
//
//  Created by Swaye Chateau on 24/03/2022.
//

import Foundation

struct Goat: Codable, Identifiable {
    var id: Int
    var name: String
    var image: String
    var likes: Int
    var fun_fact: String

}

struct GoatPopularity {
    var goatId: Int
    var isLiked: Bool = false
}
