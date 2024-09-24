import SwiftUI

struct PokedexView: View {
    @EnvironmentObject var viewModel: PokemonViewModel
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                if viewModel.pokemonList.isEmpty {
                    ProgressView()
                        .padding(.top, .extraLargeSpace)
                } else {
                    VStack(spacing: .mediumSpace) {
                        ForEach(viewModel.catchedPokemon.sorted(by: { $0.id < $1.id })) { pokemon in
                            NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                                PokemonCardView(pokemon: pokemon)
                            }
                        }
                        
                        if viewModel.offset == viewModel.pokemonList.count {
                            ProgressView()
                                .padding(.vertical)
                                .onAppear {
                                    viewModel.fetchPokemon()
                                }
                        } else {
                            GeometryReader { reader in
                                let minY = reader.frame(in: .global).minY
                                let height = UIScreen.main.bounds.height / .screenHeight
                                
                                if !viewModel.pokemonList.isEmpty && minY < height {
                                    DispatchQueue.main.async {
                                        viewModel.offset = viewModel.pokemonList.count
                                    }
                                }
                                
                                return Color.clear
                            }
                            .frame(width: .screenWidth, height: .screenWidth)
                        }
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle(viewModel.pokedexViewTitle)
            .navigationBarTitleDisplayMode(.automatic)
            .animation(.easeIn(duration: .smallAnimation), value: viewModel.pokemonList.count)
        }
        .onAppear {
            if viewModel.pokemonList.isEmpty {
                viewModel.fetchPokemon()
            }
        }
    }
}
