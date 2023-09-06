//
//  NotificationHeaderView.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 06/09/2023.
//

import SwiftUI

struct NotificationHeaderView: View {
    
    @ObservedObject var viewModel: NotificationViewModel
    
    var body: some View {
        HStack {
            viewModel.notificationType.iconImage
                .font(.title)
                .padding(.trailing, 5)
                .foregroundColor(viewModel.notificationType.tintColor)
            Text(viewModel.notificationTitle)
                .fontWeight(.semibold)
                .lineLimit(3)
                .minimumScaleFactor(0.7)
        }
        .listRowSeparatorTint(viewModel.notificationType.tintColor)
        .listRowBackground(Color(uiColor: viewModel.notificationType.backgroundColor).opacity(0.2))
    }
}

struct NotificationHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        let notification = NotificationData(type: .warning, title: testNotificationsError.title, message: testNotificationsError.message, standalone: true)
        let model = NotificationViewModel(notification: notification)
        NotificationHeaderView(viewModel: model)
    }
}
