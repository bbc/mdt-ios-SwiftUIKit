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
    
    func emailErrorMessage() {
        prepareURLtoOpen("mailto:mobile.apps@bbc.co.uk", errorToDisplay: .cantWriteEmail)
    }
    
    private func prepareURLtoOpen(_ baseURL: String, errorToDisplay error: BBCError) {
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
    
    func showErrorBanner(error: BBCError) {
        DispatchQueue.main.async {
            self.bannerData = BannerData(type: .error, detail: error.errorMessage, duration: 5)
            self.showBanner = true
        }
    }
}

public enum BBCError: Error {
    case cantWriteEmail
    
    var errorMessage: String {
        switch self {
            
        case .cantWriteEmail:
            return "Sorry, can't open your mail app! \nTry to copy the message instead"
        }
        
    }
}

