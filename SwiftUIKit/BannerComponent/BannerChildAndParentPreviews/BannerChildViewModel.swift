//
//  BannerChildViewModel.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 17/10/2023.
//

import SwiftUI

//should it not be an observable object?
class BannerChildViewModel: ObservableObject {

    @Published var isShowingBanner: Bool = false
    @Published var bannerData: BannerData = BannerData.defaultData()
    
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
