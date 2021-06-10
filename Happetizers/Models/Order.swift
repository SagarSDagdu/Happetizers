//
//  Order.swift
//  Happetizers
//
//  Created by Sagar Dagdu on 10/06/21.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    
    var total: Double {
        appetizers.reduce(0) { (result, appetizer) -> Double in
            result + appetizer.price
        }
    }
    
    func add(_ appetizer: Appetizer) {
        appetizers.append(appetizer)
    }
    
    func remove(at offsets: IndexSet) {
        appetizers.remove(atOffsets: offsets)
    }
}
