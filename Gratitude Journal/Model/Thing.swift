//
//  Thing.swift
//  Gratitude Journal
//
//  Created by Mac on 27/08/25.
//

import Foundation
import SwiftData

@Model
class Thing: Identifiable {
    
    var id: String = UUID().uuidString //Buat create random string
    var title: String = ""
    var lastUpdated: Date = Date()
    var isHidden: Bool = false
    
    init(title: String) {
        self.title = title
    }
}
