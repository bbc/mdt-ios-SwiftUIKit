//
//  NotificationAlternativeNavigationBar.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 06/09/2023.
//

import SwiftUI

struct NotificationAlternativeNavigationBar: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var isShowingConfirmationDialog: Bool = false
    
    @ObservedObject var viewModel: NotificationViewModel
    
    //MARK: - Buttons
    var dismissButton: some View {
        Button(action: {}, label: {
            Label(BBCNotificationButtons.dismissName, systemImage: BBCNotificationButtons.dismissImage)
                .labelStyle(.titleAndIcon)
                .foregroundColor(viewModel.notificationType.tintColor)
        })
        .onTapGesture {
            dismiss()
        }
    }
    
    var shareButton: some View {
        Button(action: {}, label: {
            Label(BBCNotificationButtons.shareName, systemImage: BBCNotificationButtons.shareImage)
                .labelStyle(.iconOnly)
                .foregroundColor(viewModel.notificationType.tintColor)
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
        if viewModel.isFeedbackAvailible {
            return AnyView(
                Button(BBCNotificationButtons.sendFeedbackButtonTitle,
                       action: {
                           //TODO: Add functionality
                           print("Note that no report about was sent!")
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
            viewModel.copyNotificationMessage()
        }
    }
    
    @available(iOS 16.0, *)
    var shareLink: some View {
        ShareLink(String(BBCNotificationButtons.shareLinkTitle + viewModel.notificationType.typeName), item: viewModel.messageToCopy)
    }
    
    //MARK: - View
    var body: some View {
        
        HStack {
            dismissButton
            Spacer()
            if #available(iOS 16.0, *) {
                shareButton
                    .fontWeight(.bold)
            } else {
                shareButton
                    .font(.title2)
            }
            
        }
        .listRowBackground(Color(uiColor: viewModel.notificationType.backgroundColor).opacity(0.2))
    }
}

struct NotificationAlternativeNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        let notification = NotificationData(type: .warning, title: testNotificationsError.title, message: testNotificationsError.message, standalone: true)
        let model = NotificationViewModel(notification: notification)
        NotificationAlternativeNavigationBar(viewModel: model)
    }
}
