import SwiftUI

struct PokemonCardView: View {
    var pokemon: PokemonDetail
    
    var body: some View {
        HStack(alignment: .top, spacing: .mediumSpace) {
            VStack(alignment: .leading, spacing: .smallSpace) {
                Text("#\(pokemon.id)")
                    .font(.system(size: .fontSizeLarge, weight: .bold, design: .monospaced))
                    .foregroundColor(.black)
                
                Text(pokemon.name.capitalized)
                    .font(.system(size: .fontSizeLarge, weight: .bold, design: .monospaced))
                    .foregroundColor(.white)
                
                Label(pokemon.types.first?.type.name ?? "",
                      systemImage: .pokemonIcon(pokemon.types.first?.type.name ?? ""))
                .font(.system(size: .fontSizeMedium, weight: .bold, design: .monospaced))
                .foregroundColor(.white)
                .imageScale(.large)
            }
            .padding()
            
            Spacer()
            
            AsyncImage(url: URL(string: .pokeAPISpritesUrl(id: pokemon.id))) { pokemonImage in
                pokemonImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(width: .imageSize, height: .imageSize)
            
            Spacer(minLength: .zero)
        }
        .background(Color.pokemonColor(pokemon.types.first?.type.name ?? ""))
        .shadow(color: .pokemonColor(pokemon.types.first?.type.name ?? ""),
                radius: .shadowRadius, x: .shadowOffset, y: .shadowOffset)
        .padding(.horizontal)
    }
}
