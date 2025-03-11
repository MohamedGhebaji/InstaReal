// Copyright © InstaReal. All rights reserved.

import Foundation

public extension Int {
    
    var humanReadableCount: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        
        if self >= 1_000_000 {
            return "\(formatter.string(from: NSNumber(value: Double(self) / 1_000_000)) ?? "0")M"
        } else if self >= 1_000 {
            return "\(formatter.string(from: NSNumber(value: Double(self) / 1_000)) ?? "0")K"
        } else {
            return "\(self)"
        }
    }
}
