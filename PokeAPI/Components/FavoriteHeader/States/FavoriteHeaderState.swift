import SwiftUI

struct FavoriteHeaderState {
    @Binding var isFavorite: Bool
    @Binding var triggerJump: Bool
    
    init(isFavorite: Binding<Bool>, triggerJump: Binding<Bool>) {
        self._isFavorite = isFavorite
        self._triggerJump = triggerJump
    }
}
