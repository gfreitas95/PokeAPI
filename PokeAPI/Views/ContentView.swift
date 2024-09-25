import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PokemonViewModel()
    
    var body: some View {
        TabView {
            PokemonSearchView()
                .tabItem {
                    Image(systemName: viewModel.pokemonViewImage)
                    Text(viewModel.pokemonViewTitle)
                }
                .environmentObject(viewModel)
            
            PokedexView()
                .tabItem {
                    Image(systemName: viewModel.pokedexViewImage)
                    Text(viewModel.pokedexViewTitle)
                }
                .environmentObject(viewModel)
        }
        .navigationBarBackButtonHidden(true)
        .alert(viewModel.alertTtitle, isPresented: $viewModel.isShowingAlert) {
            
        } message: {
            Text(PokeAPIErrors.pokemonNotFound.rawValue)
        }
    }
}
