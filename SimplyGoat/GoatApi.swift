//
//  GoatApi.swift
//  SimplyGoat
//
//  Created by Swaye Chateau on 24/03/2022.
//

import Foundation

class apiCall {
    func getGoats(completion:@escaping ([Goat]) -> ()) {
        guard let url = URL(string: "https://goats-api.azurewebsites.net/api/all") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let goats = try! JSONDecoder().decode([Goat].self, from: data!)
            // print(goats)
            DispatchQueue.main.async {
                completion(goats)
            }
        }
        .resume()
    }
}
