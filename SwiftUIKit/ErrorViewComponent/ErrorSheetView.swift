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
    }
    
    var shareButtonWithBugReport: some View {
        Button(action: {}, label: {
            Label("Share", systemImage: "square.and.arrow.up")
                .labelStyle(.iconOnly)
                .foregroundColor(.orange)
        })
        .onTapGesture {
            isShowingConfirmationDialog = true
        }
        .confirmationDialog("Please report this bug", isPresented: $isShowingConfirmationDialog, titleVisibility: .hidden) {
            bugReportButton
            shareOrCopyOptionButtonWithoutLabels
        }
    }
    
    var shareButtonWithoutBugReport: some View {
        if #available(iOS 16.0, *) {
            return shareLinkWithLabel
        } else {
            return copyButtonWithLabel
        }
    }
    
    var bugReportButton: some View {
        Button("Report this bug", action: {
            print("Note that no report about \(errorViewModel.errorTitle) was sent!")
        })
    }
    
    var shareOrCopyOptionButtonWithoutLabels: some View {
        if #available(iOS 16.0, *) {
            return shareLinkWithOutLabel
        } else {
            return copyButtonWithoutLabel
        }
    }
    
    private var copyButtonWithoutLabel: some View {
        Button("Copy error description") {
            errorViewModel.copyErrorMessage()
        }
    }
    
    private var copyButtonWithLabel: some View {
        Button {
            errorViewModel.copyErrorMessage()
        } label: {
            Label("Copy error description", systemImage: "square.and.arrow.up")
                .labelStyle(.iconOnly)
                .foregroundColor(.orange)
        }
    }
    
    @available(iOS 16.0, *)
    var shareLinkWithOutLabel: some View {
        ShareLink("Share error description", item: errorViewModel.messageToCopy)
    }
    
    @available(iOS 16.0, *)
    var shareLinkWithLabel: some View {
        ShareLink(item: errorViewModel.messageToCopy) {
            Label("Share error description", systemImage: "square.and.arrow.up")
                .labelStyle(.iconOnly)
                .foregroundColor(.orange)
        }
    }
    
    //MARK: - View
    var body: some View {
        
        List {
            // Header
            HStack {
                dismissButton
                Spacer()
                if errorViewModel.isBugReportAvailible {
                    shareButtonWithBugReport
                } else {
                    shareButtonWithoutBugReport
                }
            }
            .font(.title2)
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
            .padding(.top, -5)
            .padding(.bottom, 5)
            
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
        let error = BBCErrorData(errorTitle: previewError.title, errorMessage: previewError.message, standalone: true)
        let modelOne = ErrorViewModel(error: error, isBugReportAvailible: true)
        let modelTwo = ErrorViewModel(error: error, isBugReportAvailible: false)
        
        ErrorSheetView(errorViewModel: modelOne)
        ErrorSheetView(errorViewModel: modelTwo)
        
    }
}
