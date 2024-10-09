import SwiftUI

struct PokemonTypes: Codable, Identifiable, Equatable, Hashable {
    let id = UUID()
    let slot: Int
    let type: PokemonType
    
    enum CodingKeys: String, CodingKey {
        case slot
        case type
    }
    
    static func mock() -> PokemonTypes {
        return .init(slot: 1, type: .mock())
    }
}

struct PokemonType: Codable, Identifiable, Equatable, Hashable {
    let id = UUID()
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
    
    static func mock() -> PokemonType {
        return .init(name: "grass", url: "https://pokeapi.co/api/v2/type/12/")
    }
}
