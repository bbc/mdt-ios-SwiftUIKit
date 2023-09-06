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
            Section("Stanalone notifications") {
                NotificationView(notificationData: testNotification.info.data)
                NotificationView(notificationData: testNotification.warning.data)
            }
            
            Section("Additional Notifications") {
                Text("First row")
                NotificationView(notificationData: testNotification.success.data)
                Text("Second row")
                NotificationView(notificationData: testNotification.error.data)
            }
            
        }
    }
}

struct NotificationPreview_Previews: PreviewProvider {
    static var previews: some View {
        NotificationPreview()
    }
}
