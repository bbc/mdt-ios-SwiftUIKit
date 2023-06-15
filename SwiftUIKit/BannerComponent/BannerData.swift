//
//  BannerData.swift
//  BBCFeedbackViewController
//
//  Created by Maria Kharybina on 14/06/2023.
//

import SwiftUI

struct BannerData: Identifiable {
    var id = UUID()
    
    var type: BannerType
    var detail: String
    var duration: TimeInterval = 3
    
    static func defaultData() -> BannerData {
        return BannerData(type: .info, detail: "")
    }
    
    enum BannerType {
        case info
        case warning
        case success
        case error
        case loading
        
        var tintColor: Color {
            switch self {
            case .info:
                return .gray
            case .success:
                return .green
            case .warning:
                return .orange
            case .error:
                return .red
            case .loading:
                return .blue
            }
        }
        
        var iconImage: Image? {
            switch self {
            case .info:
                return Image(systemName: "info.circle")
            case .warning:
                return Image(systemName: "exclamationmark.triangle")
            case .success:
                return Image(systemName: "checkmark.circle")
            case .error:
                return Image(systemName: "xmark.circle")
            case .loading:
                return nil
            }
        }
        
        var dismissMe: Bool {
            return self != .loading
        }
        
        var typeName: String {
            return String(describing: self)
        }
    }
}

struct BannerTestData {
    static let testBanners: [BannerData] = [
        BannerData(type: .info, detail: "We have important information to share with you. Please stay tuned", duration: 3),
        BannerData(type: .warning, detail: "It seems like something may or may not went wrong", duration: 5),
        BannerData(type: .success, detail: "Yeeey, it works 🎉", duration: 2),
        BannerData(type: .error, detail: "Something is very wrong", duration: 4)
    ]
    
    static let lodaingBanner: BannerData = BannerData(type: .loading, detail: "In a minute")
}
