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
    
    @Published var isLoading = false
    
    func getAppetizers() {
        isLoading = true
        NetworkManager.shared.getAppetizers { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let appetizers):
                    self?.appetizers = appetizers
                case .failure(let error):
                    print("Error: \(error)")
                    self?.alertItem = AlertContext.getAlertItem(for: error)
                }
            }
        }
    }
}
