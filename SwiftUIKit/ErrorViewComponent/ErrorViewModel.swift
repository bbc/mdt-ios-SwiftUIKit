//
//  ErrorViewModel.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 04/09/2023.
//

import Foundation
import SwiftUI

class ErrorViewModel: ObservableObject {
    
    var error: BBCErrorData
    
    init(error: BBCErrorData) {
        self.error = error
    }
    
    @Published var showBanner: Bool = false
    @Published var bannerData: BannerData = BannerData.defaultData()
    @Published var isShowingErrorSheet: Bool = false
    
    lazy var errorTitle: String = {
        return error.errorTitle
    }()
    
    lazy var errorMessage: String = {
        return error.errorMessage
    }()
    
    lazy var standalone: Bool = {
        return error.standalone
    }()
    
    lazy var messageToCopy: String = {
        return "Hey! I ran into this error: \(errorTitle). \n\(errorMessage)"
    }()

    func copyErrorMessage() {
        copyToClipboard(item: messageToCopy)
        copiedSuccessfully()
    }
    
    private func copyToClipboard(item: String) {
        let pasteboard = UIPasteboard.general
        pasteboard.string = item
    }
    
    private func copiedSuccessfully() {
        DispatchQueue.main.async {
            self.bannerData = BannerData(type: .success, detail: "Error description copied!", duration: 3)
            self.showBanner = true
        }
    }
    
}
