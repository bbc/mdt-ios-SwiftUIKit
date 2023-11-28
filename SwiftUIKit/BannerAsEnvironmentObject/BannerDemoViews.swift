//
//  BannerDemoViews.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 28/11/2023.
//

import SwiftUI

struct BannerDemoView: View {
    
    @StateObject var bannerManager = PresentBannerManager()
    
    var body: some View {
        ZStack {
            DemoGlobalMessageTab()
                .environmentObject(bannerManager)
            if bannerManager.isPresented {
                BannerContentView(bannerManager: bannerManager)
            }
        }
    }
}

struct DemoGlobalMessageTab: View {
    @EnvironmentObject var banerManager: PresentBannerManager
    
    var body: some View {
        TabView() {
            TabContent01(viewModel: TabContent01ViewModel(bannerManager: banerManager))
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("01")
                }
            TabContent02()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("02")
                }
        }
    }
}

struct TabContent01: View {
    @EnvironmentObject var banerManager: PresentBannerManager
    @ObservedObject var viewModel: TabContent01ViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    viewModel.showBanner()
                }, label: {
                    Text("Present ShowGlobalBanner")
                })
                .padding()
                
                Button(action: {
                    self.banerManager.dismissBanner()
                }, label: {
                    Text("Dismiss ShowGlobalBanner")
                })
                .padding()
                
                Button(action: {
                    self.banerManager.showBanner(bannerData: BannerData(type: .loading, detail: "In a minute!"))
                }, label: {
                    Text("Start loading")
                })
                
                Button(action: {
                    self.banerManager.dismissBanner()
                }, label: {
                    Text("Stop loading")
                })
                
                NavigationLink(destination: DemoView()) {
                    Text("Go to next View")
                }
                .padding()
            }
            .navigationTitle("First")
        }
    }
}

struct TabContent02: View {
    @EnvironmentObject var banerManager: PresentBannerManager
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    banerManager.showBanner(bannerData: BannerData.defaultData())
                }, label: {
                    Text("Present ShowGlobalBanner")
                })
                .padding()
                
            }
            .navigationTitle("Second")
        }
    }
}

struct DemoView: View {
    @EnvironmentObject var banerManager: PresentBannerManager
    
    var body: some View {
        VStack {
            Button(action: {
                banerManager.showBanner(bannerData: BannerData.defaultData())
            }, label: {
                Text("Present ShowGlobalBanner")
            })
            .padding()
        }
        .navigationTitle("DemoView")
    }
}
