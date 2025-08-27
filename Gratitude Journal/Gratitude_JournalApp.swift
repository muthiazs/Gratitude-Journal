//
//  Gratitude_JournalApp.swift
//  Gratitude Journal
//
//  Created by Mac on 27/08/25.
//

import SwiftUI

@main
struct Gratitude_JournalApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .modelContainer(for: [Day.self, Thing.self])
        }
    }
}
