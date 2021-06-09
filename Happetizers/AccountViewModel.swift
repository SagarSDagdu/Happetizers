//
//  AccountViewModel.swift
//  Happetizers
//
//  Created by Sagar Dagdu on 09/06/21.
//

import Foundation
import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthday = Date()
    @Published var extraNapkins = false
    @Published var frequentRefills = false
    
    @Published var alertItem: AlertItem?

    func saveData() {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            alertItem = AlertContext.invalidFormData
            return
        }
        
        guard email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return
        }
        
        print("Save")
    }
    
}
