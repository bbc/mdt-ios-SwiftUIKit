//
//  NotificationView.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 04/09/2023.
//

import SwiftUI

struct NotificationView: View {
    
    @ObservedObject var notificationViewModel: NotificationViewModel
    
    @State private var canBeExpanded = false
    
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
                    .background(GeometryReader { geometry in
                        Color.clear.onAppear {
                            self.canNotificationBeExtanded(geometry)
                        }
                    })
            }
        }
        .allowsHitTesting(canBeExpanded)
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
    
    private func canNotificationBeExtanded(_ geometry: GeometryProxy) {
        let total = self.notificationViewModel.notificationMessage.boundingRect(
            with: CGSize(
                width: geometry.size.width,
                height: .greatestFiniteMagnitude
            ),
            options: .usesLineFragmentOrigin,
            attributes: [.font: notificationViewModel.standalone ? UIFont.preferredFont(forTextStyle: .subheadline) : UIFont.preferredFont(forTextStyle: .caption1)],
            context: nil
        )

        if total.size.height > geometry.size.height {
            self.canBeExpanded = true
        }
    }
    
}


struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(type: .error, title: testNotificationsError.title, message: "Please check your connection to internet", standalone: true)
    }
}
