//
//  GoatApi.swift
//  SimplyGoat
//
//  Created by Swaye Chateau on 24/03/2022.
//

import Foundation

class apiCall {
    var apiEndpoint = "https://goats-api.azurewebsites.net/api";
    
    func getGoats(completion:@escaping ([Goat]) -> ()) {
        guard let url = URL(string: apiEndpoint + "/all") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let goats = try! JSONDecoder().decode([Goat].self, from: data!)
            DispatchQueue.main.async {
                completion(goats)
            }
        }
        .resume()
    }
    
    func asyncGetGoats() async throws -> [Goat]? {
        guard let goatUrl = URL(string: apiEndpoint + "/all") else { return nil }
        let (data, _) = try await URLSession.shared.data(from: goatUrl)
        let (goatsResponse) = try? JSONDecoder().decode([Goat].self, from: data)
        return goatsResponse ?? []
    }
}
