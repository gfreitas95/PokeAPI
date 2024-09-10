import SwiftUI

struct PokemonView: View {
    @EnvironmentObject var viewModel: PokemonViewModel
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: viewModel.pokemonSpriteUrl(pokemon: pokemon))) { pokemonImage in
                pokemonImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: .imageSize, height: .imageSize)
            } placeholder: {
                ProgressView()
                    .frame(width: .imageSize, height: .imageSize)
            }
            .background(.thinMaterial)
            .clipShape(Circle())
            
            Text(pokemon.name.capitalized)
                .font(.system(size: .fontSize, weight: .bold, design: .monospaced))
                .padding(.bottom, .mediumSpace)
        }
    }
}
