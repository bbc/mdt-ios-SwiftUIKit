//
//  BannerParentViewModel.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 17/10/2023.
//

import Foundation
import Combine

class BannerParentViewModel: ObservableObject {
    @Published var childViewModel = BannerChildViewModel()
    
    var anyCancellable: AnyCancellable? = nil

        init() {
            anyCancellable = childViewModel.objectWillChange.sink { [weak self] (_) in
                self?.objectWillChange.send()
            }
        }
}
