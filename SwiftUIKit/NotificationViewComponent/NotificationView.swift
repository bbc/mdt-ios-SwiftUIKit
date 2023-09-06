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
        self.notificationViewModel = NotificationViewModel(notification: notification)
    }
    
    private var titleFont: Font {
        notificationViewModel.standalone ? .headline : .footnote
    }
    
    private var messageFont: Font {
        notificationViewModel.standalone ? .subheadline : .caption
    }

    var body: some View {
        
        HStack(alignment: .center, spacing: 15) {
            notificationViewModel.notificationType.iconImage
                .font(.headline)
                .padding(.leading)
                .foregroundColor(notificationViewModel.notificationType.tintColor)
            VStack (alignment: .leading, spacing: 2) {
                Text(notificationViewModel.notificationTitle)
                    .font(titleFont)
                    .lineLimit(2)
                Text(notificationViewModel.notificationMessage)
                    .font(messageFont)
                    .lineLimit(3)
                    .background(GeometryReader { geometry in
                        Color.clear.onAppear {
                            notificationViewModel.canNotificationBeExtanded(geometry)
                        }
                    })
            }
        }
        .allowsHitTesting(notificationViewModel.canBeExpanded)
        .onTapGesture {
                notificationViewModel.isShowingNotificationSheet = true
        }
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
        NotificationView(type: .error, title: testNotificationsError.title, message: "Please check your connection to internet", standalone: true)
    }
}
