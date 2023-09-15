//
//  NotificationSheetView.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 04/09/2023.
//

import SwiftUI

struct NotificationSheetView: View {
    
    @ObservedObject var notificationViewModel: NotificationViewModel
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        List {
            NotificationAlternativeNavigationBar(viewModel: notificationViewModel)
            .padding(.bottom, -10)
            .listRowBackground(Color(uiColor: notificationViewModel.notificationType.backgroundColor).opacity(0.2))
            .listRowSeparator(.hidden)
            
            // Title
            Text(notificationViewModel.notificationTitle)
                .listRowSeparatorTint(notificationViewModel.notificationType.tintColor)
                .listRowBackground(Color(uiColor: notificationViewModel.notificationType.backgroundColor).opacity(0.2))
                .padding(.top, -5)
            
            // Main text
            Text(notificationViewModel.notificationMessage)
                .font(.caption)
                .listRowSeparator(.hidden)
        }
        .banner(data: $notificationViewModel.bannerData, showBanner: $notificationViewModel.showBanner)
    }
}


struct NotificationSheetView_Previews: PreviewProvider {
    static var previews: some View {
        let notification = NotificationData(type: .warning, title: testNotificationsError.title, message: testNotificationsError.message, standalone: true)
        let model = NotificationViewModel(notification: notification)
        NotificationSheetView(notificationViewModel: model)
    }
}
