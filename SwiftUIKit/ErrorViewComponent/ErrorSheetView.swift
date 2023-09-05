//
//  ErrorSheetView.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 04/09/2023.
//

import SwiftUI

struct ErrorSheetView: View {
    
    @ObservedObject var errorViewModel: ErrorViewModel
    
    @Environment(\.dismiss) private var dismiss
    @State private var isShowingConfirmationDialog: Bool = false
    
    //MARK: - Buttons
    var dismissButton: some View {
        Button(action: {}, label: {
            Label("Go back", systemImage: "arrow.backward")
                .labelStyle(.iconOnly)
                .foregroundColor(.orange)
        })
        .onTapGesture {
            dismiss()
        }
        .font(.title2)
    }
    
    var shareButton: some View {
        Button(action: {}, label: {
            Label("Share", systemImage: "square.and.arrow.up.fill")
                .labelStyle(.iconOnly)
                .foregroundColor(.orange)
        })
        .onTapGesture {
            isShowingConfirmationDialog = true
        }
        .font(.title2)
    }
    
    private var copyButton: some View {
        Button("Copy error description") {
            errorViewModel.copyErrorMessage()
        }
    }
    
    private var emailButton: some View {
        Button("Email error to mobile.apps@bbc.co.uk") {
            errorViewModel.emailErrorMessage()
        }
    }
    
    var shareLink: some View {
        ShareLink(item: errorViewModel.messageToCopy) {
            Label("Share", systemImage: "square.and.arrow.up")
                .labelStyle(.iconOnly)
                .foregroundColor(.orange)
        }
        .font(.title2)
    }
    
    var bugReportButton: some View {
        Button {
            print("Note that no report about \(errorViewModel.errorTitle) was sent!")
        } label: {
            Label("Report this bug", systemImage: "ladybug.fill")
                .labelStyle(.titleAndIcon)
        }
        .buttonStyle(.borderedProminent)
        .tint(.orange)
        .fontWeight(.semibold)
    }
    
    //MARK: - View
    var body: some View {
        
        List {
            // Header
            HStack {
                dismissButton
                shareLink
                shareButton
                    .confirmationDialog("Please report this bug", isPresented: $isShowingConfirmationDialog, titleVisibility: .hidden) {
                        emailButton
                        copyButton
                    }
                Spacer()
                bugReportButton
                    .padding(.top, 5)
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color(uiColor: UIColor.orange).opacity(0.2))
            
            // Title
            HStack {
                Image(systemName: "exclamationmark.triangle")
                    .font(.title)
                    .padding(.trailing, 5)
                    .foregroundColor(.orange)
                Text(errorViewModel.errorTitle)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.7)
            }
            .listRowSeparatorTint(.orange)
            .listRowBackground(Color(uiColor: UIColor.orange).opacity(0.2))
            
            // Main text
            Text(errorViewModel.errorMessage)
                .font(.caption)
                .listRowSeparator(.hidden)
        }
        .banner(data: $errorViewModel.bannerData, showBanner: $errorViewModel.showBanner)
    }
}


struct ErrorSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorSheetView(errorViewModel: ErrorViewModel(error: BBCErrorData(errorTitle: previewError.title, errorMessage: previewError.message, standalone: true)))
    }
}
