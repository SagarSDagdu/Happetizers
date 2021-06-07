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
        HStack {
            Image("asian-flank-steak")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 80)
                .cornerRadius(8)
            VStack(alignment: .leading) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
            }
            .padding(.leading)
        }
    }
}

struct AppetizerListCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListCell(appetizer: MockData.mockAppetizers().first!)
    }
}
