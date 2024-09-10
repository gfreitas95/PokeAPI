import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var viewModel: PokemonViewModel
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            PokemonView(pokemon: pokemon)
            
            VStack(alignment: .center, spacing: .smallSpace) {
                Text(viewModel.id)
                    .font(.system(size: .fontSize, weight: .medium, design: .monospaced))
                
                Text(viewModel.types)
                    .font(.system(size: .fontSize, weight: .medium, design: .monospaced))
                
                Text(viewModel.effort)
                    .font(.system(size: .fontSize, weight: .medium, design: .monospaced))
                
                Text(viewModel.baseStat)
                    .font(.system(size: .fontSize, weight: .medium, design: .monospaced))
                
                Text(viewModel.statName)
                    .font(.system(size: .fontSize, weight: .medium, design: .monospaced))
                
                Text(viewModel.height)
                    .font(.system(size: .fontSize, weight: .medium, design: .monospaced))
                
                Text(viewModel.weight)
                    .font(.system(size: .fontSize, weight: .medium, design: .monospaced))
            }
            Spacer()
        }
        .onAppear {
            viewModel.getPokemonDetails(pokemon: pokemon)
        }
    }
}
