import SwiftUI

struct PokemonPage: Codable {
    let count: Int
    let next: String
    let results: [Pokemon]
    
    static func mock() -> PokemonPage {
        return .init(
            count: 1302,
            next: "https://pokeapi.co/api/v2/pokemon?offset=1000&limit=302",
            results: [.mock()])
    }
}
