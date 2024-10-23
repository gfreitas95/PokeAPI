import SwiftUI

extension String {
    static func pokemonIcon(_ type: String) -> String {
        switch type {
        case "fire": return "flame"
        case "poison": return "lizard"
        case "bug": return "ant"
        case "grass": return "leaf"
        case "water": return "water.waves"
        case "electric": return "bolt"
        case "psychic": return "figure.mind.and.body"
        case "normal": return "person"
        case "ground": return "mountain.2"
        case "flying": return "wind"
        case "fairy": return "rainbow"
        case "fighting": return "figure.boxing"
        case "ice": return "snowflake"
        case "dragon": return "bird"
        case "ghost": return "eye"
        case "dark": return "poweroutlet.type.k"
        default: return "atom"
        }
    }
}
