import SwiftUI

struct PokemonAlertView: View {
    var state: PokemonAlertState
    
    var body: some View {
        VStack {
            Image(.professorOak)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: .iconSize, height: .iconSize)
                .background {
                    Circle()
                        .fill(.red.gradient)
                        .background {
                            Circle()
                                .fill(.background)
                                .padding(-.extraSmallSpace)
                        }
                }
            
            Text(state.title)
                .font(.system(size: .fontSizeLarge, weight: .bold, design: .monospaced))
            
            Text(state.message)
                .font(.system(size: .fontSizeMedium, weight: .medium, design: .monospaced))
                .multilineTextAlignment(.center)
                .foregroundStyle(.gray)
                .padding([.top, .bottom], .extraSmallSpace)
            
            HStack(spacing: .smallSpace) {
                Button {
                    state.isPresented = false
                    state.actionHandler()
                } label: {
                    Text(state.buttonTitle)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .padding(.vertical, .smallSpace)
                        .padding(.horizontal, .largeSpace)
                        .background {
                            RoundedRectangle(cornerRadius: .alertRadius)
                                .fill(.red.gradient)
                        }
                }
            }
        }
        .frame(width: .alertSize)
        .padding([.horizontal, .bottom], .largeSpace)
        .background {
            RoundedRectangle(cornerRadius: .largeSpace)
                .fill(.background)
                .padding(.top, .largeSpace)
        }
    }
}
