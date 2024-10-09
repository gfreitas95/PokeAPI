import SwiftUI

struct ModalAlert: Shape {
    func path(in rect: CGRect) -> Path {
        let cornerRadius = CGSize(width: .modalAlertRadius, height: .modalAlertRadius)
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: cornerRadius)
        
        return Path(path.cgPath)
    }
}
