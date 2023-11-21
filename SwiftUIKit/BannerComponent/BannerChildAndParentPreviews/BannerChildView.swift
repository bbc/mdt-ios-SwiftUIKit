//
//  BannerChildView.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 17/10/2023.
//

import SwiftUI

struct BannerChildView: View {
    
    @ObservedObject var viewModel: BannerChildViewModel
    
    var body: some View {
        VStack {
            Button("Show the error banner") {
                viewModel.showErrorBanner()
            }
            .buttonStyle(.bordered)
            HStack {
                Button("Show") {
                    viewModel.showLoadingBanner()
                }
                Spacer()
                Text("Loading banner")
                Spacer()
                Button("Hide") {
                    viewModel.dismissLoadingBanner()
                }
            }
            .padding()
        }
    }
}
