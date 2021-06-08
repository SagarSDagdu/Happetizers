//
//  AppetizerListViewModel.swift
//  Happetizers
//
//  Created by Sagar Dagdu on 07/06/21.
//

import Foundation

class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    
    @Published var alertItem: AlertItem?
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    print("Error: \(error)")
                    self.alertItem = AlertItem.getAlertItem(for: error)
                }
            }
        }
    }
}
