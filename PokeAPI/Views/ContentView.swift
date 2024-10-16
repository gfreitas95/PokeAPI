import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PokemonViewModel()
    @State var isSearchButtonTouched: Bool = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.viewTitle)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        isSearchButtonTouched.toggle()
                    }
                }) {
                    Image(systemName: viewModel.navBarButtonImage(isSearchButtonTouched))
                        .font(.title)
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                }
            }
            .padding(.horizontal)
            .background(Color.white.opacity(.shadowOpacity).ignoresSafeArea(.all, edges: .top))
            
            if isSearchButtonTouched {
                PokemonSearchView()
                    .environmentObject(viewModel)
                    .transition(.blurReplace)
            } else {
                PokemonListView()
                    .environmentObject(viewModel)
                    .transition(.blurReplace)
            }
        }
        .navigationBarBackButtonHidden(true)
        .oakAlert(message: viewModel.errorMessage, isPresented: $viewModel.isShowingAlert) {}
    }
}
