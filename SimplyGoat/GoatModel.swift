//
//  GoatModel.swift
//  SimplyGoat
//
//  Created by Swaye Chateau on 24/03/2022.
//

import Foundation

struct Goat: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
    let likes: Int
    let fun_fact: String
}
