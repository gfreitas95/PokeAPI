import SwiftUI

struct OnboardView: View {
    private let title = "Hello there,\nWelcome to the world of Pokemon".capitalized
    private let buttonTitle = "Gotta Catch ém All !"
    var actionHandler: () -> ()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: .mediumSpace) {
                Text(title)
                    .font(.system(size: .fontSizeLarge, weight: .bold, design: .monospaced))
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                
                Image(.professorOak)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                NavigationLink(destination: ContentView()) {
                    Text(buttonTitle)
                        .padding(.smallSpace)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(.smallSpace)
                        .padding(.horizontal, .smallSpace)
                        .foregroundColor(.white)
                        .font(.system(size: .fontSizeLarge, weight: .bold, design: .monospaced))
                        .onTapGesture {
                            actionHandler()
                        }
                }
            }
            .padding()
            .frame(maxHeight: .infinity)
            .background(Color.gray.opacity(.shadowOpacity)).ignoresSafeArea()
        }
    }
}
