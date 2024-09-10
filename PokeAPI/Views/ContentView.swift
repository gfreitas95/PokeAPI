import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PokemonViewModel()
    private let adaptiveColumns = [GridItem(.adaptive(minimum: .columGridSize))]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: adaptiveColumns, spacing: .smallSpace) {
                    ForEach(viewModel.filteredPokemon) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                            PokemonView(pokemon: pokemon)
                        }
                    }
                }
                .animation(.easeIn(duration: .smallAnimation), value: viewModel.filteredPokemon.count)
                .navigationTitle(viewModel.title)
                .navigationBarTitleDisplayMode(.automatic)
            }
            .searchable(text: $viewModel.searchText)
            .autocorrectionDisabled(true)
        }
        .environmentObject(viewModel)
    }
}
