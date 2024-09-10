import SwiftUI

struct Pokemon: Codable, Identifiable, Equatable {
    let id = UUID()
    let name: String
    let url: String
    
    static func mock() -> Pokemon {
        return .init(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
    }
}
