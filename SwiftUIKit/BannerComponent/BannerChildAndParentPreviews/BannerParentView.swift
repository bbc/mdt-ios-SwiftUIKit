//
//  BannerParentView.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 17/10/2023.
//

import SwiftUI

struct BannerParentView: View {
    
    @ObservedObject var viewModel: BannerParentViewModel = BannerParentViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "bubbles.and.sparkles")
                .font(.title)
                .foregroundStyle(.green)
                .padding(.bottom)
            
            let childViewModel = BannerChildViewModel(isShowingBanner: $viewModel.isShowingBanner, bannerData: $viewModel.bannerData)
            BannerChildView(viewModel: childViewModel)
                .padding()
            
            Image(systemName: "testtube.2")
                .font(.largeTitle)
                .foregroundStyle(.green)
        }
        .banner(data: $viewModel.bannerData, showBanner: $viewModel.isShowingBanner)
    }
}

#Preview {
    BannerParentView()
}
