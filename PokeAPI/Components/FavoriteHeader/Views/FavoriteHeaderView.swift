import SwiftUI

struct FavoriteHeaderView: View {
    var state: FavoriteHeaderState
    
    var body: some View {
        HStack {
            Spacer()
            
            Button {
                state.isFavorite.toggle()
                state.triggerJump.toggle()
            } label: {
                Image(systemName: state.isFavorite ? "heart.fill" : "heart")
                    .font(.title)
                    .foregroundStyle(state.isFavorite ? .red : .black)
            }
            .jumpAnimation(state.$triggerJump)
            .padding(.trailing)
        }
    }
}
