import SwiftUI

struct PokemonSearchView: View {
    @EnvironmentObject var viewModel: PokemonViewModel
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: .mediumSpace) {
                    HStack(spacing: .smallSpace) {
                        Image(systemName: viewModel.searchBarImage)
                            .foregroundColor(.gray)
                        
                        TextField(viewModel.searchBarPlaceholder, text: $viewModel.searchText)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled(true)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, .smallSpace)
                    .padding(.horizontal)
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(.shadowOpacity), radius: .xyRadius, x: .xyRadius, y: .xyRadius)
                    .shadow(color: Color.black.opacity(.shadowOpacity), radius: .xyRadius, x: -.xyRadius, y: -.xyRadius)
                }
                .padding()
                
                if let pokemon = viewModel.filteredPokemon {
                    NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                        PokemonCardView(pokemon: pokemon)
                    }
                } else {
                    if !viewModel.searchText.isEmpty {
                        ProgressView()
                            .padding(.top, .largeSpace)
                    }
                }
            }
            .navigationTitle(viewModel.pokemonViewTitle)
        }
    }
}
