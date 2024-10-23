import SwiftUI

extension View {
    @ViewBuilder func linearGradient(
        _ type: String,
        baseColor: Color = .white,
        startPoint: UnitPoint = .top,
        endPoint: UnitPoint = .bottom
    ) -> some View {
        self.modifier(LinearGradientView(
            type: type,
            baseColor: baseColor,
            startPoint: startPoint,
            endPoint: endPoint
        ))
    }
}

fileprivate struct LinearGradientView: ViewModifier {
    var type: String
    var baseColor: Color
    var startPoint: UnitPoint
    var endPoint: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .background(LinearGradient(gradient: Gradient(colors: [baseColor, .pokemonColor(type)]),
                                       startPoint: startPoint, endPoint: endPoint).ignoresSafeArea())
    }
}
