//
//  BannerModifier.swift
//  BBCFeedbackViewController
//
//  Created by Maria Kharybina on 13/06/2023.
//

import SwiftUI

struct BannerModifier: ViewModifier {
    
    @Binding var data: BannerData
    @Binding var showBanner: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .zIndex(-1)
            if showBanner {
                BannerView(data: data)
                    .animation(.spring())
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .onTapGesture {
                        withAnimation {
                            self.showBanner = false
                        }
                    }
                    .onAppear(perform: {
                        if data.type.dismissMe {
                            DispatchQueue.main.asyncAfter(deadline: .now() + data.duration) {
                                withAnimation {
                                    self.showBanner = false
                                    self.data = BannerData.defaultData()
                                }
                            }
                        }
                    })
            }
        }
    }
}
