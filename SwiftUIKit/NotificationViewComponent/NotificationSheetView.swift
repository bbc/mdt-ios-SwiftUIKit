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
    @State private var isShowingConfirmationDialog: Bool = false
    
    //MARK: - Buttons
    var dismissButton: some View {
        Button(action: {}, label: {
            Label(BBCNotificationButtons.dismissName, systemImage: BBCNotificationButtons.dismissImage)
                .labelStyle(.titleAndIcon)
                .foregroundColor(notificationViewModel.notificationType.tintColor)
        })
        .onTapGesture {
            dismiss()
        }
    }
    
    var shareButton: some View {
        Button(action: {}, label: {
            Label(BBCNotificationButtons.shareName, systemImage: BBCNotificationButtons.shareImage)
                .labelStyle(.iconOnly)
                .foregroundColor(notificationViewModel.notificationType.tintColor)
        })
        .onTapGesture {
            isShowingConfirmationDialog = true
        }
        .confirmationDialog(BBCNotificationButtons.comfirmationDialogTitle, isPresented: $isShowingConfirmationDialog, titleVisibility: .hidden) {
            sendFeedbackButton
            shareOrCopyOption
        }
    }
    
    var sendFeedbackButton: AnyView {
        if notificationViewModel.isFeedbackAvailible {
            return AnyView(
                Button(BBCNotificationButtons.sendFeedbackButtonTitle,
                       action: {
                           //TODO: Add functionality
                           print("Note that no report about \(notificationViewModel.notificationTitle) was sent!")
                       })
            )
        } else {
            return AnyView(EmptyView())
        }
    }
    
    var shareOrCopyOption: some View {
        if #available(iOS 16.0, *) {
            return shareLink
        } else {
            return copyButton
        }
    }
    
    var copyButton: some View {
        Button(BBCNotificationButtons.copyButtonTitle) {
            notificationViewModel.copyNotificationMessage()
        }
    }
    
    //TODO: make different title based on tupe of notification
    @available(iOS 16.0, *)
    var shareLink: some View {
        ShareLink(String(BBCNotificationButtons.shareLinkTitle + notificationViewModel.notificationType.typeName), item: notificationViewModel.messageToCopy)
    }
    
    
    //MARK: - View
    
    var body: some View {
        List {
            // Header
            HStack {
                dismissButton
                Spacer()
                shareButton
                    .font(.title2)
            }
            .padding(.bottom, -10)
            .listRowSeparator(.hidden)
            .listRowBackground(Color(uiColor: notificationViewModel.notificationType.backgroundColor).opacity(0.2))
            
            // Title
            HStack {
                notificationViewModel.notificationType.iconImage
                    .font(.title)
                    .padding(.trailing, 5)
                    .foregroundColor(notificationViewModel.notificationType.tintColor)
                Text(notificationViewModel.notificationTitle)
                    .fontWeight(.semibold)
                    .lineLimit(3)
                    .minimumScaleFactor(0.7)
            }
            .padding(.top, -2)
            .listRowSeparatorTint(notificationViewModel.notificationType.tintColor)
            .listRowBackground(Color(uiColor: notificationViewModel.notificationType.backgroundColor).opacity(0.2))
            
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
