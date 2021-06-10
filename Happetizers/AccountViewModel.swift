//
//  AccountViewModel.swift
//  Happetizers
//
//  Created by Sagar Dagdu on 09/06/21.
//

import Foundation
import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @Published var user = User(firstName: "", lastName: "", email: "", birthday: Date())
    
    @Published var alertItem: AlertItem?

    func saveData() {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidFormData
            return
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return
        }
        
        print("Save")
    }
    
}
