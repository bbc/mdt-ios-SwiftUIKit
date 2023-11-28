//
//  BannerSetUpView.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 28/11/2023.
//

import SwiftUI

struct BannerSetUpView: View {
    @StateObject var bannerManager = BannerManager()
    
    var body: some View {
        ZStack {
            BannerMainView()
                .environmentObject(bannerManager)
                .zIndex(-1)
            if bannerManager.isPresented {
                BannerView(bannerManager: bannerManager)
            }
        }
    }
}

#Preview {
    BannerSetUpView()
}
