//
//  NotificationViewModel.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 04/09/2023.
//

import Foundation
import SwiftUI

class NotificationViewModel: ObservableObject {
    
    private var notification: NotificationData
    
    init(notification: NotificationData) {
        self.notification = notification
    }
    
    @Published var showBanner: Bool = false
    @Published var bannerData: BannerData = BannerData.defaultData()
    @Published var isShowingNotificationSheet: Bool = false
    @Published var isFeedbackAvailible: Bool = true
    @Published var canBeExpanded: Bool = false
    
    lazy var notificationTitle: String = {
        return notification.title
    }()
    
    lazy var notificationMessage: String = {
        return notification.message
    }()
    
    lazy var standalone: Bool = {
        return notification.standalone
    }()
    
    lazy var notificationType: NotificationData.NotificationType = {
        return notification.type
    }()
    
    lazy var messageToCopy: String = {
        return "\(BBCNotificationPhrases.messageToCopyStart) \(notificationType.typeName): \(notificationTitle). \n\(notificationMessage)"
    }()

    func copyNotificationMessage() {
        copyToClipboard(item: messageToCopy)
        copiedSuccessfully()
    }
    
    private func copyToClipboard(item: String) {
        let pasteboard = UIPasteboard.general
        pasteboard.string = item
    }
    
    
    private func copiedSuccessfully() {
        DispatchQueue.main.async {
            self.bannerData = BannerData(type: .success, detail: BBCNotificationPhrases.copiedToClipboard, duration: 3)
            self.showBanner = true
        }
    }
    
    private func prepareURLtoOpen(_ baseURL: String, errorToDisplay error: NotificationError) {
        guard
            let url = schemeURL(baseURL),
            UIApplication.shared.canOpenURL(url)
        else {
            self.showErrorBanner(error: error)
            return
        }
        
        UIApplication.shared.open(url)
    }
    
    private func schemeURL(_ stringURL: String) -> URL? {
        return URL(string: stringURL)
    }
    
    func showErrorBanner(error: NotificationError) {
        //TODO: check with G how to add weak self here
        DispatchQueue.main.async {
            self.bannerData = BannerData(type: .error, detail: error.localizedDescription, duration: 5)
            self.showBanner = true
        }
    }
    
    func canNotificationBeExtanded(_ geometry: GeometryProxy) {
        let total = self.notificationMessage.boundingRect(
            with: CGSize(
                width: geometry.size.width,
                height: .greatestFiniteMagnitude
            ),
            options: .usesLineFragmentOrigin,
            attributes: [.font: standalone ? UIFont.preferredFont(forTextStyle: .subheadline) : UIFont.preferredFont(forTextStyle: .caption1)],
            context: nil
        )

        if total.size.height > geometry.size.height {
            self.canBeExpanded = true
        }
    }
}
