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
    var body: some View {
        TabView() {
            TabContent01()
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
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    self.banerManager.banner = .init(
                        title: "demo title",
                        message: "demo message"
                    )
                }, label: {
                    Text("Present ShowGlobalBanner")
                })
                .padding()
                
                Button(action: {
                    self.banerManager.dismiss()
                }, label: {
                    Text("Dismiss ShowGlobalBanner")
                })
                .padding()
                
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
                    self.banerManager.banner = .init(
                        title: "demo title",
                        message: "demo message"
                    )
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
                self.banerManager.banner = .init(
                    title: "demo title",
                    message: "demo message"
                )
            }, label: {
                Text("Present ShowGlobalBanner")
            })
            .padding()
        }
        .navigationTitle("DemoView")
    }
}
