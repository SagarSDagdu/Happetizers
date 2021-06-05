//
//  Appetizer.swift
//  Happetizers
//
//  Created by Sagar Dagdu on 05/06/21.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    
    // Nutritional Info
    let calories: Int
    let protein: Int
    let carbs: Int
}

// Helper struct to parse response
struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

