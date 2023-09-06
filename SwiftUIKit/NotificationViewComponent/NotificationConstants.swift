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
    static let sendFeedbackButtonTitle = "Share your feedback"
    static let copyButtonTitle = "Copy to clipboard"
    static let shareLinkTitle = "Share a description of this "
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
