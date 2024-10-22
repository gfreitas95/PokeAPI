import SwiftUI

struct PokemonImageView: View {
    var state: PokemonImageState
    
    var body: some View {
        AsyncImage(url: URL(string:  .pokeAPISpritesUrl(id: state.id))) { pokemonImage in
            pokemonImage
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView()
        }
        .frame(width: .imageSize, height: .imageSize)
    }
}
