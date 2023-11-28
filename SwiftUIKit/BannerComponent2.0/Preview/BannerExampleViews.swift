//
//  BannerExampleViews.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 28/11/2023.
//

import SwiftUI

struct BannerMainView: View {
    @EnvironmentObject var bannerManager: BannerManager
    
    var body: some View {
        TabView() {
            FirstTabView(viewModel: FirstTabViewModel())
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("01")
                }
            SecondTabView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("02")
                }
        }
    }
}

struct FirstTabView: View {
    @EnvironmentObject var bannerManager: BannerManager
    @ObservedObject var viewModel: FirstTabViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Show banner from the view model:")
                VStack {
                    Button("Success") {
                        viewModel.someProcessWentRight()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                    
                    Button("Error") {
                        viewModel.someProcessWentWrong()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                    
                    HStack {
                        Button("Start Loading") {
                            viewModel.startLoading()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.blue)
                        
                        Button("Stop loading") {
                            viewModel.stopLoading()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.blue)
                    }
                    
                }
                
                Text("Show banner from the view:")
                Button("Show warning") {
                    self.bannerManager.showBanner(bannerData: .init(type: .warning, detail: "Something may go wrong here!"))
                }
                
                HStack {
                    Button("Start loading") {
                        self.bannerManager.showBanner(bannerData: BannerData(type: .loading, detail: "In a minute!"))
                    }
                    
                    Button("Stop loading") {
                        self.bannerManager.dismissBanner()
                    }
                }
                
                NavigationLink(destination: DemoView()) {
                    Text("Go to next View")
                }
                .padding()
            }
            .onChange(of: viewModel.bannerData, perform: { _ in
                guard let newData = viewModel.bannerData else { return }
                bannerManager.showBanner(bannerData: newData)
            })
            .onChange(of: viewModel.finishedLoading, perform: { _ in
                if viewModel.finishedLoading {
                    bannerManager.dismissBanner()
                }
            })
            .navigationTitle("First")
        }
    }
}

struct SecondTabView: View {
    @EnvironmentObject var bannerManager: BannerManager
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    bannerManager.showBanner(bannerData: BannerData.defaultData())
                }, label: {
                    Text("ShowBanner")
                })
                .padding()
                
            }
            .navigationTitle("Second")
        }
    }
}

struct DemoView: View {
    @EnvironmentObject var bannerManager: BannerManager
    
    var body: some View {
        VStack {
            Button(action: {
                bannerManager.showBanner(bannerData: BannerData.defaultData())
            }, label: {
                Text("Show banner")
            })
            .padding()
        }
        .navigationTitle("DemoView")
    }
}
