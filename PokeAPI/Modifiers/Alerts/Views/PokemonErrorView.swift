import SwiftUI

extension View {
    @ViewBuilder func oakAlert(
        title: String = "Ops ...",
        message: String = "Try again",
        buttonTitle: String = "Ok",
        isPresented: Binding<Bool>,
        onDismiss: @escaping () -> ()
    ) -> some View {
        self.modifier(PokemonErrorView(
            title: title,
            message: message,
            buttonTitle: buttonTitle,
            onDismiss: onDismiss,
            isPresented: isPresented)
        )
    }
}

fileprivate struct PokemonErrorView: ViewModifier {
    var title: String
    var message: String
    var buttonTitle: String
    var onDismiss: () -> ()
    @Binding var isPresented: Bool
    @State private var animateView: Bool = false
    @State private var presentFullScreenCover: Bool = false
    
    func body(content: Content) -> some View {
        let screenHeight = screenSize.height
        let animateView = animateView
        
        content
            .fullScreenCover(isPresented: $presentFullScreenCover, onDismiss: onDismiss) {
                ZStack {
                    Rectangle()
                        .fill(.black.opacity(.alertOpacity))
                        .ignoresSafeArea()
                        .opacity(animateView ? 1 : 0)
                    
                    PokemonAlertView(
                        title: title,
                        message: message,
                        buttonTitle: buttonTitle,
                        actionHandler: onDismiss,
                        isPresented: $isPresented)
                    .visualEffect({ content, proxy in
                        content
                            .offset(y: offset(proxy, screenHeight: screenHeight, animateView: animateView))
                    })
                    .presentationBackground(.clear)
                    .task {
                        guard !animateView else { return }
                        withAnimation(.bouncy(duration: .smallAnimation, extraBounce: .animationBounce)) {
                            self.animateView = true
                        }
                    }
                    .ignoresSafeArea(.container, edges: .all)
                }
            }
            .onChange(of: isPresented) { oldValue, newValue in
                if newValue {
                    toggleView(true)
                } else {
                    Task {
                        withAnimation(.snappy(duration: .mediumAnimation, extraBounce: .zero)) {
                            self.animateView = false
                        }
                        
                        try? await Task.sleep(for: .seconds(.mediumAnimation))
                        toggleView(false)
                    }
                }
            }
    }
    
    private func toggleView(_ status: Bool) {
        var transaction = Transaction()
        transaction.disablesAnimations = true
        
        withTransaction(transaction) {
            presentFullScreenCover = status
        }
    }
    
    nonisolated func offset(_ proxy: GeometryProxy, screenHeight: CGFloat, animateView: Bool) -> CGFloat {
        let viewHeight = proxy.size.height
        return animateView ? 0 : (screenHeight + viewHeight) / 2
    }
    
    var screenSize: CGSize {
        if let screenSize = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.screen.bounds.size {
            return screenSize
        }
        return .zero
    }
}
