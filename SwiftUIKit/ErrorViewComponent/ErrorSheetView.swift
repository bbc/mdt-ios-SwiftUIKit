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
    
    private var copyButton: some View {
        createCopyButton()
    }
    
    private var emailButton: some View {
        createEmailButton()
    }
    
    private var bugReportButton: some View {
        createBugReportButton()
    }
    
    var shareButton: some View {
        Button(action: {}, label: {
            Label("Share", systemImage: "square.and.arrow.up")
                .labelStyle(.iconOnly)
                .foregroundColor(.orange)
        })
        .onTapGesture {
            isShowingConfirmationDialog = true
        }
    }
    
    var dismissButton: some View {
            Button(action: {}, label: {
                Label("Dismiss", systemImage: "xmark")
                    .labelStyle(.iconOnly)
                    .foregroundColor(.orange)
            })
            .onTapGesture {
                dismiss()
            }
    }
    
    
    var body: some View {
        
        NavigationView {
            List {
                HStack {
                    Image(systemName: "exclamationmark.triangle")
                        .foregroundColor(.orange)
                        .font(.title)
                        .padding(.trailing, 5)
                    Text(errorViewModel.errorTitle)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                    Spacer()
                    shareButton
                        .font(.title2)
                        .confirmationDialog("Please report this bug", isPresented: $isShowingConfirmationDialog, titleVisibility: .hidden) {
                            bugReportButton
                            emailButton
                            copyButton
                        }

                    dismissButton
                        .font(.title2)
                }
                .listRowSeparatorTint(.orange)
                .listRowBackground(Color(uiColor: UIColor.orange).opacity(0.2))
                
                Text(errorViewModel.errorMessage)
                    .font(.caption)
                    .listRowSeparator(.hidden)
            }
            .banner(data: $errorViewModel.bannerData, showBanner: $errorViewModel.showBanner)
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
    
    private func createCopyButton() -> some View {
        let copyButtonName: String = "Copy error description"
        let contactCopyButton = Button(copyButtonName) {
            errorViewModel.copyErrorMessage()
        }
        return contactCopyButton
    }
    
    private func createEmailButton() -> some View {
        let emailButtonName: String = "Email error to mobile.apps@bbc.co.uk"
        let emailButton = Button(emailButtonName) {
            errorViewModel.emailErrorMessage()
        }
        return emailButton
    }
    
    private func createBugReportButton() -> some View {
        let reportButtonName: String = "Report this bug 🚨"
        let reportButton = Button(reportButtonName) {
            print("Report about \(errorViewModel.errorTitle) send!")
        }
        return reportButton
    }
}


struct ErrorSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorSheetView(errorViewModel: ErrorViewModel(error: BBCErrorData(errorTitle: previewError.title, errorMessage: previewError.message, standalone: true)))
    }
}
