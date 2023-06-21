//
//  BannerView.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 15/06/2023.
//

import SwiftUI

struct BannerView: View {
    
    var data: BannerData
    
    var body: some View {
        VStack {
            HStack {
                
                if data.type == .loading {
                    ProgressView()
                        .tint(.white)
                        .progressViewStyle(.circular)
                        .padding(.trailing, 5)
                        .padding(.leading, 5)
                        .font(.title)
                } else {
                    data.type.iconImage
                        .font(.title)
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(data.detail)
                        .font(.callout)
                        .fontWeight(.semibold)
                }
                Spacer()
            }
            .foregroundColor(Color.white)
            .padding(12)
            .background(data.type.tintColor)
            .cornerRadius(8)
            .shadow(radius: 3)
            Spacer()
        }
        .padding()
    }
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BannerView(data: BannerData(type: .loading, detail: "One second"))
            BannerView(data: BannerData(type: .error, detail: "Oops"))
            BannerView(data: BannerData(type: .info, detail: "Look!"))
            BannerView(data: BannerData(type: .success, detail: "Yeey!"))
            BannerView(data: BannerData(type: .warning, detail: "Wait a second"))
        }
    }
}
