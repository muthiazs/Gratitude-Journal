

import SwiftUI
import SwiftData

struct AddThingView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @State private var thingTitle = ""
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 10) {
            TextField("What makes you feel grateful?", text: $thingTitle)
                .textFieldStyle(.roundedBorder)
            
            Button("Add") {
                // Add into SwiftData
                addThing()
                
                thingTitle = ""
                
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .disabled(thingTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
        }
        .padding()
        
    }
    
    func addThing() {
        
        // Clean the text
        let cleanedTitle = thingTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Add into DB
        context.insert(Thing(title: cleanedTitle))
        
        try? context.save()
    }
}

#Preview {
    AddThingView()
}
