//
//  BannerParentView.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 17/10/2023.
//

import SwiftUI

struct BannerParentView: View {
    
    @State private var viewModel: BannerParentViewModel = BannerParentViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "bubbles.and.sparkles")
                .font(.title)
                .foregroundStyle(.green)
                .padding(.bottom)
            
            BannerChildView(viewModel:  $viewModel.childViewModel)
                .padding()
            
            Image(systemName: "testtube.2")
                .font(.largeTitle)
                .foregroundStyle(.green)
        }
        .banner(data: $viewModel.childViewModel.bannerData, showBanner: $viewModel.childViewModel.isShowingBanner)
    }
}

#Preview {
    BannerParentView()
}
