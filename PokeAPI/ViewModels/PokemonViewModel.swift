import SwiftUI

final class PokemonViewModel: ObservableObject {
    
    var types = ""
    var effort = ""
    var baseStat = ""
    var statName = ""
    let title = "Pokedex"
    private let pokemonManager = PokemonManager()
    
    @Published var searchText = ""
    @Published var pokemonList = [Pokemon]()
    @Published var pokemonDetails: PokemonDetail?
    
    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemonList : pokemonList.filter {
            $0.name.contains(searchText.lowercased())
        }
    }
    
    var id: String {
        return "ID: \(pokemonDetails?.id ?? 0)"
    }
    
    var height: String {
        let height = pokemonDetails?.height ?? 0
        return .formatHeightAndWeight(type: "Height: ", value: height) + " M"
    }
    
    var weight: String {
        let weight = pokemonDetails?.weight ?? 0
        return .formatHeightAndWeight(type: "Weight: ", value: weight) + " KG"
    }
    
    func getPokemonTypes(data: PokemonDetail) {
        data.types.forEach { type in
            types = "Type: \(type.type.name)"
        }
    }
    
    func getPokemonStats(data: PokemonDetail) {
        data.stats.forEach { stat in
            effort = "Effort: \(stat.effort)"
            baseStat = "Base Stat: \(stat.base_stat)"
            statName = "Stat Name: \(stat.stat.name)"
        }
    }
    
    func pokemonSpriteUrl(pokemon: Pokemon) -> String {
        return .pokeAPISpritesUrl(id: getPokemonId(pokemon: pokemon))
    }
    
    func getPokemonId(pokemon: Pokemon) -> Int {
        if let id = self.pokemonList.firstIndex(of: pokemon) { return id + 1 }
        return 0
    }
    
    func getPokemonDetails(pokemon: Pokemon) {
        let id = getPokemonId(pokemon: pokemon)
        self.pokemonDetails = .mock()
        
        pokemonManager.getDetailPokemon(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetails = data
                self.getPokemonStats(data: data)
                self.getPokemonTypes(data: data)
            }
        }
    }
    
    init() {
        self.pokemonList = pokemonManager.getPokemon()
    }
}
