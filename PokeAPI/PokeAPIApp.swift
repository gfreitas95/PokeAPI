import SwiftUI

@main
struct PokeAPIApp: App {
    @AppStorage("isLogged") var isLogged: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isLogged {
                ContentView()
            } else {
                OnboardView() {
                    isLogged = true
                }
            }
        }
    }
}
