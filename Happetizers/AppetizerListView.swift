//
//  AppetizerListView.swift
//  Happetizers
//
//  Created by Sagar Dagdu on 05/06/21.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(MockData.mockAppetizers()) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                }
            }.navigationTitle("🍗 Appetizers")
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
