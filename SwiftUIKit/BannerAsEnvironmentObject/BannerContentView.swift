//
//  BannerContentView.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 28/11/2023.
//

import SwiftUI

struct BannerContentView: View {
    @ObservedObject var bannerManager: PresentBannerManager
        
        var body: some View {
            VStack {
                HStack {
                    Image.init(systemName: "scribble.variable")
                    VStack(alignment: .leading, spacing: 2) {
                        Text(bannerManager.banner?.title ?? "")
                            .bold()
                        Text(bannerManager.banner?.message ?? "")
                            .fontWeight(.medium)
    }
                    Spacer()
                }
                .padding(12)
                .foregroundColor(.white)
                .background(Color.gray)
                .cornerRadius(8)
                
                Spacer()
            }
            .padding()
            .animation(.easeInOut, value: bannerManager.banner)
            .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
            .onTapGesture {
                withAnimation {
                    bannerManager.dismiss()
                }
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        bannerManager.dismiss()
                    }
                }
            })
        }
}
