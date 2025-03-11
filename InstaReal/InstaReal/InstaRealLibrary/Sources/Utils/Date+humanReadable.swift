// Copyright © InstaReal. All rights reserved.

import Foundation

public extension Date {
    
    var humanReadable: String {
        let calendar = Calendar.current
        let now = Date()
        let components = calendar.dateComponents([.day, .hour, .minute], from: self, to: now)
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        
        if let days = components.day, days >= 1 {
            formatter.dateFormat = "d MMMM"
            return formatter.string(from: self)
        } else if let hours = components.hour, hours >= 1 {
            return "Il y a \(hours) heure\(hours > 1 ? "s" : "")"
        } else if let minutes = components.minute, minutes >= 1 {
            return "Il y a \(minutes) minute\(minutes > 1 ? "s" : "")"
        } else {
            return "Il y a quelques secondes"
        }
    }
}
