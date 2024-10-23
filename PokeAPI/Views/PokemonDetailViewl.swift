import SwiftUI

struct PokemonDetailView: View {
    @State private var triggerJump: Bool = false
    @State private var isFavorite: Bool = false
    var pokemon: PokemonDetail
    
    var body: some View {
        VStack {
            FavoriteHeaderView(state: FavoriteHeaderState(
                isFavorite: $isFavorite,
                triggerJump: $triggerJump
            ))
            
            PokemonImageView(state: PokemonImageState(
                id: pokemon.id,
                type: pokemon.types.first?.type.name ?? ""
            ))
            .roundedStyle(pokemon.types.first?.type.name ?? "")
            
            Spacer().frame(height: .mediumSpace)
            
            Text(pokemon.name.capitalized)
                .font(.system(size: .fontSizeExtraLarge, weight: .bold, design: .monospaced))
            
            Spacer().frame(height: .mediumSpace)
            
            DetailSectionView(state: DetailSectionState(
                id: pokemon.id,
                type: pokemon.types.first?.type.name ?? "",
                effort: pokemon.stats.first?.effort ?? 0,
                baseStat: pokemon.stats.first?.baseStat ?? 0,
                statName: pokemon.stats.first?.stat.name ?? "",
                height: pokemon.height,
                weight: pokemon.weight,
                baseExperience: pokemon.baseExperience
            ))
            
            Spacer()
        }
        .onTapGesture(count: 2) {
            isFavorite.toggle()
            triggerJump.toggle()
        }
        .linearGradient(pokemon.types.first?.type.name ?? "")
    }
}
