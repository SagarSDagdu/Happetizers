//
//  AccountViewModel.swift
//  Happetizers
//
//  Created by Sagar Dagdu on 09/06/21.
//

import Foundation
import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") var userData: Data?
    
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
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        } catch {
            print("User save failure: \(error)")
            alertItem = AlertContext.userSaveFailure
        }
    }
    
    func retrieveUser() {
        guard let userData = userData else { return }
        
        do {
            let user = try JSONDecoder().decode(User.self, from: userData)
            self.user = user
        } catch {
            return
        }
    }
    
}
