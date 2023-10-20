//
//  BannerChildViewModel.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 17/10/2023.
//

import SwiftUI

class BannerChildViewModel: ObservableObject {
    @Binding var isShowingBanner: Bool
    @Binding var bannerData: BannerData
    
    init(isShowingBanner: Binding<Bool>, bannerData: Binding<BannerData>) {
        _isShowingBanner = isShowingBanner
        _bannerData = bannerData
    }
    
    func showErrorBanner() {
        DispatchQueue.main.async {
            self.bannerData = BannerData(type: .error, detail: "Oops, something went wrong")
            self.isShowingBanner = true
        }
    }
    
    func showLoadingBanner() {
        DispatchQueue.main.async {
            self.bannerData = BannerData(type: .loading, detail: "Loading...")
            self.isShowingBanner = true
        }
    }
    
    func dismissLoadingBanner() {
        DispatchQueue.main.async {
            withAnimation {
                self.isShowingBanner = false
            }
        }
    }
    
    
}
