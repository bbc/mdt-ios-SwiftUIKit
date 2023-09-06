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
            Label("Dismiss", systemImage: "xmark")
                .labelStyle(.titleAndIcon)
                .foregroundColor(notificationViewModel.notification.type.tintColor)
        })
        .onTapGesture {
            dismiss()
        }
    }
    
    var shareButton: some View {
        Button(action: {}, label: {
            Label("Share", systemImage: "square.and.arrow.up")
                .labelStyle(.iconOnly)
                .foregroundColor(notificationViewModel.notification.type.tintColor)
        })
        .onTapGesture {
            isShowingConfirmationDialog = true
        }
        .confirmationDialog("Please share your feedback", isPresented: $isShowingConfirmationDialog, titleVisibility: .hidden) {
            sendFeedbackButton
            shareOrCopyOption
        }
    }
    
    var sendFeedbackButton: AnyView {
        if notificationViewModel.isFeedbackAvailible {
            return AnyView(
                Button("Share your feedback",
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
        Button("Copy to clipboard") {
            notificationViewModel.copyNotificationMessage()
        }
    }
    
    //TODO: make different title based on tupe of notification
    @available(iOS 16.0, *)
    var shareLink: some View {
        ShareLink("Share \(notificationViewModel.notification.type.typeName) description", item: notificationViewModel.messageToCopy)
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
            .listRowBackground(Color(uiColor: notificationViewModel.notification.type.backgroundColor).opacity(0.2))
            
            // Title
            HStack {
                notificationViewModel.notification.type.iconImage
                    .font(.title)
                    .padding(.trailing, 5)
                    .foregroundColor(notificationViewModel.notification.type.tintColor)
                Text(notificationViewModel.notificationTitle)
                    .fontWeight(.semibold)
                    .lineLimit(3)
                    .minimumScaleFactor(0.7)
            }
            .padding(.top, -2)
            .listRowSeparatorTint(notificationViewModel.notification.type.tintColor)
            .listRowBackground(Color(uiColor: notificationViewModel.notification.type.backgroundColor).opacity(0.2))
            
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
        let notification = NotificationData(type: .warning, title: previewError.title, message: previewError.message, standalone: true)
        let model = NotificationViewModel(notification: notification)
        NotificationSheetView(notificationViewModel: model)
    }
}
