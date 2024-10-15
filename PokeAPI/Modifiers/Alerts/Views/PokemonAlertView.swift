import SwiftUI

struct PokemonAlertView: View {
    var title: String
    var message: String
    var buttonTitle: String
    var actionHandler: () -> ()
    @Binding var isPresented: Bool
    
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
            
            Text(title)
                .font(.system(size: .fontSizeLarge, weight: .bold, design: .monospaced))
            
            Text(message)
                .font(.system(size: .fontSizeMedium, weight: .medium, design: .monospaced))
                .multilineTextAlignment(.center)
                .foregroundStyle(.gray)
                .padding([.top, .bottom], .extraSmallSpace)
            
            HStack(spacing: .smallSpace) {
                Button {
                    isPresented = false
                    actionHandler()
                } label: {
                    Text(buttonTitle)
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
