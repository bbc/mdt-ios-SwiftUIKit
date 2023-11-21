//
//  BannerChildViewModel.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 17/10/2023.
//

import SwiftUI

struct BannerChildViewModel {

    var isShowingBanner: Bool = false
    var bannerData: BannerData = .defaultData()

    mutating func showErrorBanner() {
        self.bannerData = BannerData(type: .error, detail: "Oops, something went wrong")
        self.isShowingBanner = true
    }
    
    mutating func showLoadingBanner() {
        self.bannerData = BannerData(type: .loading, detail: "Loading...")
        self.isShowingBanner = true
    }
    
    mutating func dismissLoadingBanner() {
        self.isShowingBanner = false
    }
}
