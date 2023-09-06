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
            Image(systemName: "exclamationmark.triangle")
                .font(.headline)
                .padding(.leading)
                .foregroundColor(.orange)
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
        NotificationView(type: .warning, title: previewError.title, message: previewError.message, standalone: true)
    }
}

enum previewError {
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
