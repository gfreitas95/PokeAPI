import SwiftUI

extension View {
    @ViewBuilder func roundedStyle(_ type: String) -> some View {
        self.modifier(RoundedStyleView(type: type))
    }
}

fileprivate struct RoundedStyleView: ViewModifier {
    var type: String
    
    func body(content: Content) -> some View {
        content
            .background(Color.pokemonColor(type))
            .clipShape(Circle())
            .shadow(color: .pokemonColor(type),
                    radius: .shadowRadius, x: .shadowOffset, y: .shadowOffset)
    }
}
