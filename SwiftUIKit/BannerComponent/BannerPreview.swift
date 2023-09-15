//
//  BannerPreview.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 15/06/2023.
//

import SwiftUI

@available(iOS 16.0, *)
struct BannerPreview: View {
    
    var banners = BannerTestData.testBanners
    var loadingBanner = BannerTestData.lodaingBanner
    
    @State var isShowing: Bool = false
    @State var data: BannerData = BannerData.defaultData()
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Timed banners") {
                    ForEach(banners) { banner in
                        Button {
                            withAnimation {
                                self.data = banner
                                self.isShowing = true
                            }
                        } label: {
                            Text(banner.type.typeName.capitalized + " banner")
                        }
                    }
                }
                
                Section("Indefinite banner") {
                    Button("Start loading") {
                        withAnimation {
                            self.data = loadingBanner
                            self.isShowing = true
                        }
                    }
                    Button("Stop loading") {
                        withAnimation {
                            self.isShowing = false
                        }
                    }
                }
            }
            .banner(data: $data, showBanner: $isShowing)
            .navigationTitle("Banner preview")
        }
    }
}

@available(iOS 16.0, *)
struct BannerPreview_Previews: PreviewProvider {
    static var previews: some View {
        BannerPreview()
    }
}
