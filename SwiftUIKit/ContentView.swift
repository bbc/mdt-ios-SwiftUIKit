//
//  ContentView.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 15/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        if #available(iOS 16.0, *) {
            BannerDemoView()
        } else {
            Text("No view")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
