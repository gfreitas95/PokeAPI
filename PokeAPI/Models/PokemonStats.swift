import SwiftUI

struct PokemonStats: Codable {
    let base_stat: Int
    let effort: Int
    let stat: PokemonStat
    
    static func mock() -> PokemonStats {
        return .init(base_stat: 45, effort: 0, stat: .mock())
    }
}

struct PokemonStat: Codable {
    let name: String
    let url: String
    
    static func mock() -> PokemonStat {
        return .init(name: "hp", url: "https://pokeapi.co/api/v2/stat/1/")
    }
}
