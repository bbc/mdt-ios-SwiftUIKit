//
//  BannerExampleViewModels.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 28/11/2023.
//

import Foundation

@MainActor
final class FirstTabViewModel: ObservableObject {
    
    @Published var bannerData: BannerData?
    @Published var finishedLoading: Bool = false
    
    func someProcessWentRight() {
        bannerData = BannerData(type: .success, detail: "Yaay")
    }
    
    func someProcessWentWrong() {
        bannerData = BannerData(type: .error, detail: "Ooops")
    }
    
    func startLoading() {
        bannerData = BannerData(type: .loading, detail: "In a second...")
        finishedLoading = false
    }
    
    func stopLoading() {
        finishedLoading = true
    }
}
