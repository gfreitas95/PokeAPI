import SwiftUI

struct DetailSectionView: View {
    var state: DetailSectionState
    
    var body: some View {
        VStack(alignment: .center, spacing: .smallSpace) {
            Text("ID: \(state.id)")
                .font(.system(size: .fontSizeMedium, weight: .medium, design: .monospaced))
            
            Text("Type: \(state.type)")
                .font(.system(size: .fontSizeMedium, weight: .medium, design: .monospaced))
            
            Text("Effort: \(state.effort)")
                .font(.system(size: .fontSizeMedium, weight: .medium, design: .monospaced))
            
            Text("Base Stat: \(state.baseStat)")
                .font(.system(size: .fontSizeMedium, weight: .medium, design: .monospaced))
            
            Text("Stat Name: \(state.statName)")
                .font(.system(size: .fontSizeMedium, weight: .medium, design: .monospaced))
            
            Text(.formatHeightAndWeight(type: "Height: ", value: state.height) + " M")
                .font(.system(size: .fontSizeMedium, weight: .medium, design: .monospaced))
            
            Text(.formatHeightAndWeight(type: "Weight: ", value: state.weight) + " KG")
                .font(.system(size: .fontSizeMedium, weight: .medium, design: .monospaced))
            
            Text("Base Experience: \(state.baseExperience)")
                .font(.system(size: .fontSizeMedium, weight: .medium, design: .monospaced))
        }
    }
}
