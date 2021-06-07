//
//  AppetizerListViewModel.swift
//  Happetizers
//
//  Created by Sagar Dagdu on 07/06/21.
//

import Foundation

class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    
    @Published var error: APError?
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            switch result {
            case .success(let appetizers):
                self.appetizers = appetizers
            case .failure(let error):
                print("Error: \(error)")
                self.error = error
            }
        }
    }
}
