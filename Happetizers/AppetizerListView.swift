//
//  AppetizerListView.swift
//  Happetizers
//
//  Created by Sagar Dagdu on 05/06/21.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var appetizerListViewModel = AppetizerListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(appetizerListViewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                }
            }.navigationTitle("🍗 Appetizers")
        }.onAppear() {
            appetizerListViewModel.getAppetizers()
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
