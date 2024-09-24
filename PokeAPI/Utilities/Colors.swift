import SwiftUI

extension Color {
    
    static func pokemonColor(_ type: String) -> Color {
        switch type {
        case "fire": return Color(.systemRed)
        case "poison": return Color(.systemPurple)
        case "bug": return Color(.systemGreen)
        case "grass": return Color(.systemGreen)
        case "water": return Color(.systemBlue)
        case "electric": return Color(.systemYellow)
        case "psychic": return Color(.systemPurple)
        case "normal": return Color(.systemOrange)
        case "ground": return Color(.systemGray)
        case "flying": return Color(.systemTeal)
        case "fairy": return Color(.systemPink)
        case "fighting": return Color(.systemBrown)
        default: return Color(.systemIndigo)
        }
    }
}
