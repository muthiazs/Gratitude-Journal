

import SwiftUI

struct ToolTipView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundStyle(.purple)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(.purple, lineWidth: 1)
                    .background(.purple.opacity(0.1)) // biar ada soft bg
            }
    }
}

#Preview {
    ToolTipView(text: "Hello, World!")
}
