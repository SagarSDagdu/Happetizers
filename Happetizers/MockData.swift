//
//  MockData.swift
//  Happetizers
//
//  Created by Sagar Dagdu on 05/06/21.
//

import Foundation

struct MockData {
    static func mockAppetizers() -> [Appetizer] {
        var appetizers = [Appetizer]()
        let decoder = JSONDecoder()
        let dataUrl = Bundle.main.url(forResource: "mock_appetizers", withExtension: "json")!
        
        // Living on the EDGE with ! as this data is always expected
        let data = try! Data(contentsOf: dataUrl)
        appetizers = try! decoder.decode(AppetizerResponse.self, from: data).request
        return appetizers
    }
}
