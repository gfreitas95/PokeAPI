import SwiftUI

extension String {
    
    // MARK: - URLs
    
    
    
    // MARK: - Formatters
    
    static func formatHeightAndWeight(type: String, value: Int) -> String {
        return type + String(format: "%.2f", Double(value) / 10)
    }
}
