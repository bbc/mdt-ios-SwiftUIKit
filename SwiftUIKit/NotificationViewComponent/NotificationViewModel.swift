//
//  NotificationViewModel.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 04/09/2023.
//

import Foundation
import SwiftUI

class NotificationViewModel: ObservableObject {
    
    var notification: NotificationData
    
    init(notification: NotificationData) {
        self.notification = notification
    }
    
    @Published var showBanner: Bool = false
    @Published var bannerData: BannerData = BannerData.defaultData()
    @Published var isShowingNotificationSheet: Bool = false
    @Published var isFeedbackAvailible: Bool = true
    
    lazy var notificationTitle: String = {
        return notification.title
    }()
    
    lazy var notificationMessage: String = {
        return notification.message
    }()
    
    lazy var standalone: Bool = {
        return notification.standalone
    }()
    
    //TODO: rewrite
    lazy var messageToCopy: String = {
        return "Hey! I ran into this error: \(notificationTitle). \n\(notificationMessage)"
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
            self.bannerData = BannerData(type: .success, detail: "Copied to clipboard!", duration: 3)
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
        DispatchQueue.main.async {
            self.bannerData = BannerData(type: .error, detail: error.errorMessage, duration: 5)
            self.showBanner = true
        }
    }
}

public enum NotificationError: Error {
    case cantWriteEmail
    
    var errorMessage: String {
        switch self {
            
        case .cantWriteEmail:
            return "Sorry, can't open your mail app! \nTry to copy the message instead"
        }
        
    }
}

