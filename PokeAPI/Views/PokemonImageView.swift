import SwiftUI

struct PokemonImageView: View {
    let id: Int
    let type: String
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string:  .pokeAPISpritesUrl(id: id))) { pokemonImage in
                pokemonImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: .imageSize, height: .imageSize)
            } placeholder: {
                ProgressView()
                    .frame(width: .imageSize, height: .imageSize)
            }
            .background(Color.pokemonColor(type))
            .clipShape(Circle())
            .shadow(color: .pokemonColor(type), radius: .shadowRadius, x: .shadowOffset, y: .shadowOffset)
        }
    }
}
