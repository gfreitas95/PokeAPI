import SwiftUI

struct PokemonDetail: Codable {
    let id: Int
    let height: Int
    let weight: Int
    let stats: [PokemonStats]
    let types: [PokemonTypes]
    
    static func mock() -> PokemonDetail {
        return .init(id: 1, height: 7, weight: 69, stats: [.mock()], types: [.mock()])
    }
}
