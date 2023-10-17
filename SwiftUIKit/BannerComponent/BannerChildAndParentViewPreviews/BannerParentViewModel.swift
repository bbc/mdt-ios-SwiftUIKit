//
//  BannerParentViewModel.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 17/10/2023.
//

import SwiftUI

class BannerParentViewModel: ObservableObject {
        
    @Published var isShowingBanner: Bool = false
    @Published var bannerData: BannerData = BannerData.defaultData()
    
}
