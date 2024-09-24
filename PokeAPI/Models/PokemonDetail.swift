import SwiftUI

struct PokemonDetail: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let baseExperience: Int
    let stats: [PokemonStats]
    let types: [PokemonTypes]
    
    static func mock() -> PokemonDetail {
        return .init(
            id: 1,
            name: "bulbasaur",
            height: 7,
            weight: 69,
            baseExperience: 62,
            stats: [.mock()],
            types: [.mock()]
        )
    }
}
