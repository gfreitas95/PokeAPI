import SwiftUI

struct PokemonStats: Codable, Identifiable, Equatable, Hashable {
    let id = UUID()
    let baseStat: Int
    let effort: Int
    let stat: PokemonStat
    
    static func mock() -> PokemonStats {
        return .init(baseStat: 45, effort: 0, stat: .mock())
    }
}

struct PokemonStat: Codable, Identifiable, Equatable, Hashable {
    let id = UUID()
    let name: String
    let url: String
    
    static func mock() -> PokemonStat {
        return .init(name: "hp", url: "https://pokeapi.co/api/v2/stat/1/")
    }
}
