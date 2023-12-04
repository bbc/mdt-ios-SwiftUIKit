//
//  BannerView.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 28/11/2023.
//

import SwiftUI

struct BannerView: View {
    @ObservedObject var bannerManager: BannerManager
    
    var body: some View {
        BannerContentView(data: bannerManager.data)
            .animation(.spring, value: bannerManager.data)
            .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
            .onTapGesture {
                if bannerManager.data.type.dismissMe {
                    withAnimation {
                        bannerManager.dismissBanner()
                    }
                }
            }
            .onAppear(perform: {
                if bannerManager.data.type.dismissMe {
                    DispatchQueue.main.asyncAfter(deadline: .now() + bannerManager.data.duration) {
                        withAnimation {
                            bannerManager.dismissBanner()
                        }
                    }
                }
            })
    }
}
