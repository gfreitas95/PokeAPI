import SwiftUI

@main
struct PokeAPIApp: App {
    @AppStorage("isLogin") var isLogin: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isLogin {
                ContentView()
            } else {
                OnboardView().onDisappear { isLogin = true }
            }
        }
    }
}
