//
//  NotificationPreview.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 06/09/2023.
//

import SwiftUI

struct NotificationPreview: View {
    var body: some View {
        List {
            Section("Standalone notifications") {
                NotificationView(type: .info,
                                 title: TestNotification.info.data.title,
                                 message: TestNotification.info.data.message,
                                 standalone: true)
                NotificationView(type: .warning,
                                 title: TestNotification.warning.data.title,
                                 message: TestNotification.warning.data.message,
                                 standalone: true)
            }
            
            Section("Additional Notifications") {
                Text("First row")
                NotificationView(type: .success,
                                 title: TestNotification.success.data.title,
                                 message: TestNotification.success.data.message,
                                 standalone: false)
                Text("Second row")
                NotificationView(type: .error,
                                 title: TestNotification.error.data.title,
                                 message: TestNotification.error.data.message,
                                 standalone: false)
            }
            
        }
    }
}

struct NotificationPreview_Previews: PreviewProvider {
    static var previews: some View {
        NotificationPreview()
    }
}
