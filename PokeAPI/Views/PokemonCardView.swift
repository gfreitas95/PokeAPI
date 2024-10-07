import SwiftUI

struct PokemonCardView: View {
    private let typeIconImage = "circle.grid.cross.fill"
    var pokemon: PokemonDetail
    
    var body: some View {
        HStack(alignment: .top, spacing: .mediumSpace) {
            VStack(alignment: .leading, spacing: .extraSmallSpace) {
                Text("#\(pokemon.id)")
                    .font(.system(size: .fontSizeLarge, weight: .bold, design: .monospaced))
                    .foregroundColor(.black)
                
                Text(pokemon.name.capitalized)
                    .font(.system(size: .fontSizeLarge, weight: .bold, design: .monospaced))
                    .foregroundColor(.white)
                
                HStack(spacing: .smallSpace) {
                    Label(pokemon.types.first?.type.name ?? "", systemImage: typeIconImage)
                        .font(.system(size: .fontSizeMedium, weight: .bold, design: .monospaced))
                        .foregroundColor(.white)
                }
            }
            .padding()
            
            Spacer()
            
            AsyncImage(url: URL(string: .pokeAPISpritesUrl(id: pokemon.id))) { pokemonImage in
                pokemonImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: .imageSize, height: .imageSize)
            } placeholder: {
                ProgressView()
                    .frame(width: .imageSize, height: .imageSize)
            }
            
            Spacer(minLength: .minLength)
        }
        .background(Color.pokemonColor(pokemon.types.first?.type.name ?? ""))
        .shadow(color: .pokemonColor(pokemon.types.first?.type.name ?? ""),
                radius: .shadowRadius, x: .shadowOffset, y: .shadowOffset)
        .padding(.horizontal)
    }
}
