import SwiftUI

extension String {
    
    // MARK: - Json Files
    
    static let pokemon_json = "pokemon.json"
    
    // MARK: - URLs
    
    static func pokeAPIDetailsUrl(id: Int) -> String {
        return "https://pokeapi.co/api/v2/pokemon/\(id)/"
    }
    
    static func pokeAPISpritesUrl(id: Int) -> String {
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"
    }
    
    // MARK: - Formatters
    
    static func formatHeightAndWeight(type: String, value: Int) -> String {
        return type + String(format: "%.2f", Double(value) / 10)
    }
}
