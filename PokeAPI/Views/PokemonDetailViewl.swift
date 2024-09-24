import SwiftUI

struct PokemonDetailView: View {
    var pokemon: PokemonDetail
    
    var body: some View {
        VStack {
            PokemonImageView(id: pokemon.id, type: pokemon.types.first?.type.name ?? "")
            
            Spacer().frame(height: .mediumSpace)
            
            Text(pokemon.name.capitalized)
                .font(.system(size: .mediumSpace, weight: .bold, design: .monospaced))
            
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
    }
}
