import SwiftUI

struct PokemonStats: Codable, Identifiable, Equatable, Hashable {
    let id = UUID()
    let baseStat: Int
    let effort: Int
    let stat: PokemonStat
    
    enum CodingKeys: String, CodingKey {
        case baseStat
        case effort
        case stat
    }
    
    static func mock() -> PokemonStats {
        return .init(baseStat: 45, effort: 0, stat: .mock())
    }
}

struct PokemonStat: Codable, Identifiable, Equatable, Hashable {
    let id = UUID()
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
    
    static func mock() -> PokemonStat {
        return .init(name: "hp", url: "https://pokeapi.co/api/v2/stat/1/")
    }
}
