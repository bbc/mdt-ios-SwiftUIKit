//
//  NotificationView.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 04/09/2023.
//

import SwiftUI

struct NotificationView: View {
    
    @ObservedObject var notificationViewModel: NotificationViewModel
    
    init(type: NotificationData.NotificationType, title: String, message: String, standalone: Bool) {
        let notification = NotificationData(type: type, title: title, message: message, standalone: standalone)
        let notificationVM = NotificationViewModel(notification: notification)
        self.notificationViewModel = notificationVM
    }

    var body: some View {
        
        HStack(alignment: .center, spacing: 15) {
            notificationViewModel.notificationType.iconImage
                .font(.headline)
                .padding(.leading)
                .foregroundColor(notificationViewModel.notificationType.tintColor)
            VStack (alignment: .leading, spacing: 2) {
                Text(notificationViewModel.notificationTitle)
                    .font(notificationViewModel.standalone ? .headline : .footnote)
                    .lineLimit(2)
                Text(notificationViewModel.notificationMessage)
                    .font(notificationViewModel.standalone ? .subheadline : .caption)
                    .lineLimit(3)
            }
        }
        .onTapGesture { notificationViewModel.isShowingNotificationSheet = true }
        .foregroundColor(.secondary)
        .listRowBackground(Color(uiColor: UIColor.systemBackground).opacity(0.5))
        .sheet(isPresented: $notificationViewModel.isShowingNotificationSheet) {
            if #available(iOS 16.4, *) {
                NotificationSheetView(notificationViewModel: notificationViewModel)
                    .presentationDetents([.medium, .fraction(0.8)])
                    .presentationBackgroundInteraction(.disabled)
                    .presentationContentInteraction(.resizes)
            } else {
                NotificationSheetView(notificationViewModel: notificationViewModel)
            }
        }
    }
}


struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(type: .error, title: testNotificationsError.title, message: testNotificationsError.message, standalone: true)
    }
}
