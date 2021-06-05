//
//  AppetizerListCell.swift
//  Happetizers
//
//  Created by Sagar Dagdu on 05/06/21.
//

import SwiftUI

struct AppetizerListCell: View {

    let appetizer: Appetizer
    
    var body: some View {
        VStack {
            Text("Name: \(appetizer.name)")
            Text("Protein: \(appetizer.protein)")
        }
    }
}

struct AppetizerListCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListCell(appetizer: MockData.mockAppetizers().first!)
    }
}
