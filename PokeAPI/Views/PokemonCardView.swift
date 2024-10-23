import SwiftUI

struct PokemonCardView: View {
    var pokemon: PokemonDetail
    
    var body: some View {
        HStack(alignment: .top, spacing: .mediumSpace) {
            VStack(alignment: .leading, spacing: .smallSpace) {
                Text("#\(pokemon.id)")
                    .font(.system(size: .fontSizeLarge, weight: .bold, design: .monospaced))
                    .foregroundColor(.primary)
                
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
            
            PokemonImageView(state: PokemonImageState(
                id: pokemon.id,
                type: pokemon.types.first?.type.name ?? ""
            ))
            
            Spacer(minLength: .zero)
        }
        .background(Color.pokemonColor(pokemon.types.first?.type.name ?? ""))
        .shadow(color: .pokemonColor(pokemon.types.first?.type.name ?? ""),
                radius: .shadowRadius, x: .shadowOffset, y: .shadowOffset)
        .padding(.horizontal)
    }
}
