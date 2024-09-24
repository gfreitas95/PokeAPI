import SwiftUI

struct PokemonTypes: Codable, Identifiable, Equatable, Hashable {
    let id = UUID()
    let slot: Int
    let type: PokemonType
    
    static func mock() -> PokemonTypes {
        return .init(slot: 1, type: .mock())
    }
}

struct PokemonType: Codable, Identifiable, Equatable, Hashable {
    let id = UUID()
    let name: String
    let url: String
    
    static func mock() -> PokemonType {
        return .init(name: "grass", url: "https://pokeapi.co/api/v2/type/12/")
    }
}
