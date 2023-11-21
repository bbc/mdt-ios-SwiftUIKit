//
//  BannerParentView.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 17/10/2023.
//

import SwiftUI

struct BannerParentView: View {
    
    @StateObject private var viewModel = BannerParentViewModel()

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
            
            Image(systemName: "flame.fill")
                .font(.largeTitle)
                .foregroundStyle(.purple)
                .padding(.vertical)
            
            Button("Ooops!") {
                viewModel.showWarningBanner()
            }
            .buttonStyle(.borderedProminent)
        }
        .banner(data: $viewModel.childViewModel.bannerData, showBanner: $viewModel.childViewModel.isShowingBanner)
        .banner(data: $viewModel.bannerData, showBanner: $viewModel.isShowingBanner)
    }
}

#Preview {
    BannerParentView()
}
