import SwiftUI

class PokemonManager {
    
    func getPokemon() -> [Pokemon] {
        let data: PokemonPage = Bundle.main.decode(file: .pokemon_json)
        let pokemon: [Pokemon] = data.results
        return pokemon
    }
    
    func getDetailPokemon(id: Int, _ completiom: @escaping (PokemonDetail) -> ()) {
        Bundle.main.fetchData(url: .pokeAPIDetailsUrl(id: id), model: PokemonDetail.self) { data in
            completiom(data)
        } failure: { error in
            print("A wild error appears: \(error.localizedDescription)")
        }
    }
}
