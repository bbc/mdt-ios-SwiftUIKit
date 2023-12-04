//
//  BannerManager.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 28/11/2023.
//

import Foundation

final class BannerManager: ObservableObject {
    @Published var isPresented: Bool = false
    @Published var data: BannerData = BannerData.defaultData()
    
    public func showBanner(bannerData: BannerData) {
        self.data = bannerData
        self.isPresented = true
    }
    
    public func dismissBanner() {
        if isPresented {
            self.isPresented = false
            self.data = BannerData.defaultData()
        }
    }
}
