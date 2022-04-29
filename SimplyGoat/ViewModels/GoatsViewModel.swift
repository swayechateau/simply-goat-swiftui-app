//
//  GoatsViewModel.swift
//  SimplyGoat
//
//  Created by Swaye Chateau on 26/04/2022.
//

import Foundation

@MainActor
class GoatListViewModel: ObservableObject {
    @Published var apiGoatsData = [Goat]()
    @Published var goatsPopularity = [GoatPopularity]()
    @Published var goats: [GoatViewModel] = []
    
    @Published var currentGoatId: Int = 0
    
    func fetchGoats() {
        apiCall().getGoats { (goats) in
            self.apiGoatsData = goats
            self.sortGoats()
        }
    }
    
    func asyncFetchGoats() async throws {
        do {
            let goats = try await apiCall().asyncGetGoats() ?? []
            self.apiGoatsData = goats
            self.sortGoats()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func sortGoats () {
        if (self.goats.isEmpty && !self.apiGoatsData.isEmpty) {
            self.goats = []
            self.apiGoatsData.forEach { goat in
                self.goats.append(
                    GoatViewModel.init(
                        id: goat.id,
                        name: goat.name,
                        image: goat.image,
                        likes: goat.likes,
                        fun_fact: goat.fun_fact
                    )
                )
            }
        }
    }
    
    func likeGoat(id: Int) {
        self.goats[id].isLiked.toggle()
    }
    
    func getCurrentGoat () -> GoatViewModel {
        return self.goats[self.currentGoatId]
    }
    
    func setCurrentGoat(id: Int) {
        self.currentGoatId = id
    }
    
    func unsetCurrentGoat() {
        self.currentGoatId = 0
    }
}

struct GoatViewModel: Identifiable {
    
    init(id: Int, name: String, image: String, likes: Int, fun_fact: String) {
        self.id = id
        self.name = name
        self.image = image
        self.likes = likes
        self.fun_fact = fun_fact
        self.isLiked = false
    }
    
    var id: Int
    var name: String
    var image: String
    var likes: Int
    var fun_fact: String
    var isLiked: Bool
    
    mutating func like () {
        self.isLiked.toggle()
    }
}
