import SwiftUI

extension View {
    @ViewBuilder func jumpAnimation(_ triggerJump: Binding<Bool>) -> some View {
        self.modifier(JumpAnimationView(triggerJump: triggerJump))
    }
}

fileprivate struct JumpAnimationView: ViewModifier {
    @Binding var triggerJump: Bool
    
    func body(content: Content) -> some View {
        content
            .keyframeAnimator(initialValue: Jump(), trigger: triggerJump) { content, value in
                content
                    .rotationEffect(.init(degrees: value.rotation), anchor: .bottom)
                    .scaleEffect(value.scaleY, anchor: .bottom)
                    .offset(y: CGFloat(value.offsetY))
            } keyframes: { _ in
                KeyframeTrack(\.scaleY) {
                    SpringKeyframe(0.4, duration: 0.2, spring: .bouncy)
                    CubicKeyframe(1.15, duration: 0.1)
                    CubicKeyframe(1.15, duration: 0.5)
                    CubicKeyframe(1, duration: 0.2)
                }
                
                KeyframeTrack(\.rotation) {
                    CubicKeyframe(0, duration: 0.4)
                    CubicKeyframe(14, duration: 0.1)
                    CubicKeyframe(-14, duration: 0.1)
                    CubicKeyframe(0, duration: 0.1)
                }
            }
    }
}
