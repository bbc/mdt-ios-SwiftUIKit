//
//  NotificationError.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 06/09/2023.
//

import Foundation

public enum NotificationError: Error {
    case cantWriteEmail
    
    var localizedDescription: String {
        switch self {
            
        case .cantWriteEmail:
            return "Sorry, can't open your mail app! \nTry to copy the message instead"
        }
        
    }
}
