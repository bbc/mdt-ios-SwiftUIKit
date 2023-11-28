//
//  BannerDemoViewModels.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 28/11/2023.
//

import Foundation

class TabContent01ViewModel: ObservableObject {
    var bannerManager: PresentBannerManager
    
    init(bannerManager: PresentBannerManager) {
        self.bannerManager = bannerManager
    }
    
    func showBanner() {
        self.bannerManager.banner = .init(
            title: "demo title from vm",
            message: "demo message from vm"
        )
    }
}
