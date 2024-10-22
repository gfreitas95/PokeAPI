import SwiftUI

struct DetailSectionState {
    let id: Int
    let type: String
    let effort: Int
    let baseStat: Int
    let statName: String
    let height: Int
    let weight: Int
    let baseExperience: Int
    
    init(id: Int,
         type: String,
         effort: Int,
         baseStat: Int,
         statName: String,
         height: Int,
         weight: Int,
         baseExperience: Int
    ) {
        self.id = id
        self.type = type
        self.effort = effort
        self.baseStat = baseStat
        self.statName = statName
        self.height = height
        self.weight = weight
        self.baseExperience = baseExperience
    }
}
