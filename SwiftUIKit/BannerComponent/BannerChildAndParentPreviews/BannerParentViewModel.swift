//
//  BannerParentViewModel.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 17/10/2023.
//

import Foundation

class BannerParentViewModel: ObservableObject {
    @Published var childViewModel = BannerChildViewModel()
    
    @Published var isShowingBanner: Bool = false
    @Published var bannerData: BannerData = .defaultData()
    
    func showWarningBanner() {
        self.bannerData = BannerData(type: .warning, detail: "Oops, something will go wrong soon")
        self.isShowingBanner = true
    }
}
