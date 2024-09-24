import SwiftUI

extension String {
    
    static func pokeAPIListUrl(limit: Int) -> String {
        return "https://pokeapi.co/api/v2/pokemon?limit=\(limit)&offset=0"
    }
    
    static func pokeAPISearchUrl(name: String) -> String {
        return "https://pokeapi.co/api/v2/pokemon/\(name)"
    }
    
    static func pokeAPIDetailsUrl(id: Int) -> String {
        return "https://pokeapi.co/api/v2/pokemon/\(id)/"
    }
    
    static func pokeAPISpritesUrl(id: Int) -> String {
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"
    }
}
