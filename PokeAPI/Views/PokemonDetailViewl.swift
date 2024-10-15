import SwiftUI

struct PokemonDetailView: View {
    @State private var triggerJump: Bool = false
    @State private var isFavorite: Bool = false
    var pokemon: PokemonDetail
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    isFavorite.toggle()
                    triggerJump.toggle()
                } label: {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .font(.title)
                        .foregroundStyle(isFavorite ? .red : .black)
                }
                .jumpAnimation($triggerJump)
                .padding(.trailing)
            }
            
            AsyncImage(url: URL(string:  .pokeAPISpritesUrl(id: pokemon.id))) { pokemonImage in
                pokemonImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: .imageSize, maxHeight: .imageSize)
            .background(Color.pokemonColor(pokemon.types.first?.type.name ?? ""))
            .clipShape(Circle())
            .shadow(color: .pokemonColor(pokemon.types.first?.type.name ?? ""), radius: .shadowRadius, x: .shadowOffset, y: .shadowOffset)
            
            Spacer().frame(height: .mediumSpace)
            
            Text(pokemon.name.capitalized)
                .font(.system(size: .fontSizeLarge, weight: .bold, design: .monospaced))
            
            Spacer().frame(height: .mediumSpace)
            
            VStack(alignment: .center, spacing: .smallSpace) {
                Text("ID: \(pokemon.id)")
                    .font(.system(size: .fontSizeMedium, weight: .medium, design: .monospaced))
                
                Text("Type: \(pokemon.types.first?.type.name ?? "")")
                    .font(.system(size: .fontSizeMedium, weight: .medium, design: .monospaced))
                
                Text("Effort: \(pokemon.stats.first?.effort ?? 0)")
                    .font(.system(size: .fontSizeMedium, weight: .medium, design: .monospaced))
                
                Text("Base Stat: \(pokemon.stats.first?.baseStat ?? 0)")
                    .font(.system(size: .fontSizeMedium, weight: .medium, design: .monospaced))
                
                Text("Stat Name: \(pokemon.stats.first?.stat.name ?? "")")
                    .font(.system(size: .fontSizeMedium, weight: .medium, design: .monospaced))
                
                Text(.formatHeightAndWeight(type: "Height: ", value: pokemon.height) + " M")
                    .font(.system(size: .fontSizeMedium, weight: .medium, design: .monospaced))
                
                Text(.formatHeightAndWeight(type: "Weight: ", value: pokemon.weight) + " KG")
                    .font(.system(size: .fontSizeMedium, weight: .medium, design: .monospaced))
                
                Text("Base Experience: \(pokemon.baseExperience)")
                    .font(.system(size: .fontSizeMedium, weight: .medium, design: .monospaced))
            }
            
            Spacer()
        }
        .onTapGesture(count: 2) {
            isFavorite.toggle()
            triggerJump.toggle()
        }
    }
}
