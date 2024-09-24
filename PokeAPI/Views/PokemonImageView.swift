import SwiftUI

struct PokemonImageView: View {
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
            .background(Color.pokemonColor(viewModel.types))
            .clipShape(Circle())
            .shadow(color: .pokemonColor(viewModel.types), radius: 6, x: 0.0, y: 0.0)
            
            Text(pokemon.name.capitalized)
                .font(.system(size: .fontSize, weight: .bold, design: .monospaced))
                .padding(.bottom, .mediumSpace)
        }
    }
}
