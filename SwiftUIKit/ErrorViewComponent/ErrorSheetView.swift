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
    
    var copyButton: some View {
            Button(action: {}, label: {
                Label("Copy", systemImage: "doc.on.doc")
                    .labelStyle(.iconOnly)
                    .foregroundColor(.orange)
            })
            .onTapGesture {
                errorViewModel.copyErrorMessage()
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
                    copyButton
                        .font(.title2)
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
}


struct ErrorSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorSheetView(errorViewModel: ErrorViewModel(error: BBCErrorData(errorTitle: previewError.title, errorMessage: previewError.message, standalone: true)))
    }
}
