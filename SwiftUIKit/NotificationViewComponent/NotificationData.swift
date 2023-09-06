//
//  NotificationData.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 04/09/2023.
//

import Foundation

struct NotificationData {
    var title: String = ""
    var message: String = ""
    var standalone: Bool = false
    
    init(title: String, message: String, standalone: Bool) {
        self.title = title
        self.message = message
        self.standalone = standalone
    }
}
