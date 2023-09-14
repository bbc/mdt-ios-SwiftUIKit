//
//  NotificationConstants.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 06/09/2023.
//

import Foundation
import SwiftUI

public enum BBCNotificationButtons {
    static let dismissName = "Dismiss"
    static let shareName = "Share"
    static let dismissImage = "xmark"
    static let shareImage = "square.and.arrow.up"
    
    static let comfirmationDialogTitle = "Please share your feedback"
    static let sendFeedbackButtonTitle = "Send "
    static let copyButtonTitle = "Copy to clipboard"
    static let shareLinkTitle = "Share"
}

public enum BBCNotificationPhrases {
    static let messageToCopyStart = "Hey! I ran into this"
    static let copiedToClipboard = "Copied to clipboard!"
}

public enum BBCNotificationTypeHelper {
    
    static let infoIcon = "info.circle"
    static let successIcon = "checkmark.circle"
    static let warningIcon = "exclamationmark.triangle"
    static let errorIcon = "xmark.circle"

    static let positiveTypeDescription = "message"
        
    static let bugShareOption = "bug report"
    static let feedbackShareOption = "feedback"
}

public enum testNotification {
    case info
    case success
    case warning
    case error
    
    var data: NotificationData {
        switch self {
        case .info:
            return NotificationData(type: .info, title: "Info Notification - no need to do anything", message: "This is an information notification message. It provides additional details to the user.", standalone: true)
        case .success:
            return NotificationData(type: .success, title: "Success Notification", message: "Congratulations! The operation was successful. Your request has been processed and completed without any issues. We appreciate your patience and cooperation. If you have any further questions or need assistance, please feel free to reach out to our support team.", standalone: false)

        case .warning:
            return NotificationData(type: .warning, title: "Warning Notification - please share it with our team", message: testNotificationsError.message, standalone: true)
        case .error:
            return NotificationData(type: .error, title: "Error Notification - report this bug!", message: "An error occurred while processing your request. Please try again later.", standalone: false)
        }
    }
    
}

public enum testNotificationsError {
    static let title = "Something is wrong with your connection! Please check it and try again"
    static let message = """
    Invalid response from the server. Response: <NSHTTPURLResponse: 0x600001838580> { URL: https://test.staff.bbc.com/services/graphql/low-risk } { Status Code: 500, Headers {
        "Cache-Control" =     (
            "no-store"
        );
        "Content-Encoding" =     (
            gzip
        );
        "Content-Length" =     (
            92
        );
        "Content-Type" =     (
            "application/json"
        );
        Date =     (
            "Mon, 04 Sep 2023 14:13:57 GMT"
        );
        Server =     (
            "staff.bbc.com"
        );
        Via =     (
            "1.1 cbee94ab34ec9eb1b560ab196c643b20.cloudfront.net (CloudFront)"
        );
        "x-amz-cf-id" =     (
            "44fME75sSseDcJ78PWWQxDei-5StN18tHwwOvmmhaSZPqf7UZSNa4Q=="
        );
        "x-amz-cf-pop" =     (
            "LHR62-C5"
        );
        "x-amzn-requestid" =     (
            "5da74b0a-0945-46e5-a6fd-73381638d3af"
        );
        "x-amzn-trace-id" =     (
            "Root=1-64f5e625-3295ecb911b624181bb51267;Sampled=0;lineage=75a781bd:0"
        );
        "x-cache" =     (
            "Error from cloudfront"
        );
    } }
    """
}
