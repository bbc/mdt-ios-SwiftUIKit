//
//  NotificationData.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 04/09/2023.
//

import SwiftUI

struct NotificationData {
    var type: NotificationType
    var title: String
    var message: String
    var standalone: Bool = false
    
    static func defaultData() -> NotificationData {
        return NotificationData(type: .info, title: "", message: "", standalone: false)
    }
    
    enum NotificationType {
        
        case info
        case success
        case warning
        case error
        
        var tintColor: Color {
            switch self {
                
            case .info:
                return .accentColor
            case .success:
                return .green
            case .warning:
                return .orange
            case .error:
                return .red
            }
        }
        
        var backgroundColor: UIColor {
            switch self {
                
            case .info:
                return UIColor.tintColor
            case .success:
                return UIColor.green
            case .warning:
                return UIColor.orange
            case .error:
                return UIColor.red
            }
        }
        
        var iconImage: Image {
            switch self {
            case .info:
                return Image(systemName: "info.circle")
            case .success:
                return Image(systemName: "checkmark.circle")
            case .warning:
                return Image(systemName: "exclamationmark.triangle")
            case .error:
                return Image(systemName: "xmark.circle")
            }
        }
        
        var typeName: String {
            return String(describing: self)
        }
    }
}
