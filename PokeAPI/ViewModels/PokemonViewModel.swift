import SwiftUI
import Combine

final class PokemonViewModel: ObservableObject {
    var errorMessage = ""
    let viewTitle = "PokeAPI"
    let xmarkBinImage = "xmark.bin"
    let searchBarImage = "magnifyingglass"
    let searchBarPlaceholder = "Search Pokemon"
    var searchCancellable: AnyCancellable? = nil
    
    @Published var offset = 0
    @Published var searchText = ""
    @Published var isLoading = false
    @Published var isShowingAlert = false
    @Published var pokemonList = [Pokemon]()
    @Published var catchedPokemon = [PokemonDetail]()
    @Published var filteredPokemon: PokemonDetail? = nil
    
    func navBarButtonImage(_ isPressed: Bool) -> String {
        return isPressed ? xmarkBinImage : searchBarImage
    }
    
    private func setupSearch() {
        searchCancellable = $searchText
            .removeDuplicates()
            .debounce(for: 0.7, scheduler: RunLoop.main)
            .sink(receiveValue: { string in
                if string == "" {
                    self.filteredPokemon = nil
                } else {
                    self.searchPokemon()
                }
            })
    }
    
    private func requestFailureHandler(_ error: PokeAPIErrors) {
        DispatchQueue.main.async {
            self.isLoading = false
            self.isShowingAlert = true
            self.errorMessage = error.rawValue
        }
        print(PokeAPIErrors.defaultError.rawValue + error.rawValue)
    }
    
    func searchPokemon() {
        let formatedText = searchText.replacingOccurrences(of: " ", with: "%20")
        
        PokemonManager.shared.makeRequestWith(url: .pokeAPISearchUrl(name: formatedText), model: PokemonDetail.self) { [weak self] results in
            guard let self = self else { return }
            
            switch results {
            case .success(let pokemon):
                DispatchQueue.main.async {
                    if self.filteredPokemon == nil {
                        self.filteredPokemon = pokemon
                    }
                    self.isLoading = false
                }
                
            case .failure(let error):
                self.requestFailureHandler(error)
            }
        }
    }
    
    func catched(pokemon: [Pokemon]) {
        let uniqueValues = pokemon.filter { value in
            !self.catchedPokemon.contains(where: { $0.name == value.name })
        }
        
        uniqueValues.forEach { value in
            PokemonManager.shared.makeRequestWith(url: value.url, model: PokemonDetail.self) { [weak self] results in
                guard let self = self else { return }
                
                switch results {
                case .success(let pokemon):
                    DispatchQueue.main.async {
                        self.catchedPokemon.append(pokemon)
                        self.isLoading = false
                    }
                    
                case .failure(let error):
                    self.requestFailureHandler(error)
                }
            }
        }
    }
    
    func fetchPokemon() {
        isLoading = true
        let limit = pokemonList.isEmpty ? 9 : offset
        
        PokemonManager.shared.makeRequestWith(url: .pokeAPIListUrl(limit: limit), model: PokemonPage.self) { [weak self] results in
            guard let self = self else { return }
            
            switch results {
            case .success(let pokemon):
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    self.pokemonList.append(contentsOf: pokemon.results)
                    self.catched(pokemon: self.pokemonList)
                    self.isLoading = false
                }
                
            case .failure(let error):
                self.requestFailureHandler(error)
            }
        }
    }
    
    init() {
        setupSearch()
    }
}
