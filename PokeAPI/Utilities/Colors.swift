import SwiftUI

extension Color {
    
    static func pokemonColor(_ type: String) -> Color {
        switch type {
        case "fire": return Color(.systemRed)
        case "poison": return Color(.systemPurple)
        case "bug": return Color(.systemMint)
        case "grass": return Color(.systemGreen)
        case "water": return Color(.systemBlue)
        case "electric": return Color(.systemYellow)
        case "psychic": return Color(.purple.opacity(.alertOpacity))
        case "normal": return Color(.systemOrange)
        case "ground": return Color(.systemGray)
        case "flying": return Color(.systemTeal)
        case "fairy": return Color(.pink.opacity(.alertOpacity))
        case "fighting": return Color(.systemBrown)
        case "dragon": return Color(.systemIndigo)
        case "ghost": return Color(.black.opacity(.darkCardOpacity))
        case "dark": return Color(.black.opacity(.darkCardOpacity))
        case "ice": return Color(.teal.opacity(.alertOpacity))
        default: return Color(.systemFill)
        }
    }
}
