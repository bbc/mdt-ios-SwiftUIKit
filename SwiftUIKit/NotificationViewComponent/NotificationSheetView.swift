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
            // Header
            NotificationAlternativeNavigationBar(viewModel: notificationViewModel)
            .padding(.bottom, -10)
            .listRowSeparator(.hidden)
            
            // Title
            NotificationHeaderView(viewModel: notificationViewModel)
            .padding(.top, -2)
            
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
