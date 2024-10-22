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
                    SpringKeyframe(.smallAnimation, duration: .mediumDuration, spring: .bouncy)
                    CubicKeyframe(.largeAnimation, duration: .smallDuration)
                    CubicKeyframe(.largeAnimation, duration: .largeDuration)
                    CubicKeyframe(.mediumAnimation, duration: .mediumDuration)
                }
                
                KeyframeTrack(\.rotation) {
                    CubicKeyframe(.zero, duration: .largeDuration)
                    CubicKeyframe(.extraLargeAnimation, duration: .smallDuration)
                    CubicKeyframe(-.extraLargeAnimation, duration: .smallDuration)
                    CubicKeyframe(.zero, duration: .smallDuration)
                }
            }
    }
}
