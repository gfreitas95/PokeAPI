import SwiftUI

struct PokemonAlertState {
    var title: String
    var message: String
    var buttonTitle: String
    var actionHandler: () -> ()
    @Binding var isPresented: Bool
    
    init(title: String,
         message: String,
         buttonTitle: String,
         actionHandler: @escaping () -> (),
         isPresented: Binding<Bool>
    ) {
        self.title = title
        self.message = message
        self.buttonTitle = buttonTitle
        self.actionHandler = actionHandler
        self._isPresented = isPresented
    }
}
