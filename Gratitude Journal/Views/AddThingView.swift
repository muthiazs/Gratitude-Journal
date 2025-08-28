

import SwiftUI
import SwiftData

struct AddThingView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @State private var thingTitle = ""
    
    // Query untuk dapetin "Day" hari ini
    @Query(filter: Day.currentDayPredicate()) private var today: [Day]
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            
            TextField("What makes you feel grateful?", text: $thingTitle)
                .textFieldStyle(.roundedBorder)
            
            Button("Add") {
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
        let cleanedTitle = thingTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !cleanedTitle.isEmpty else { return }

        let newThing = Thing(title: cleanedTitle)
        
        // Insert ke context supaya bisa di-query di ThingsView
        context.insert(newThing)

        // Pastikan juga masuk ke Day hari ini
        if let todayDay = today.first {
            todayDay.things.append(newThing)
        } else {
            let newDay = Day()
            newDay.things.append(newThing)
            context.insert(newDay)
        }

        try? context.save()
    }

}

#Preview {
    AddThingView()
}
