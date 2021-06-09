//
//  AlertItem.swift
//  Happetizers
//
//  Created by Sagar Dagdu on 08/06/21.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("The data received from the server is invalid!"),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                           message: Text("The response received from the server is invalid!"),
                                           dismissButton: .default(Text("OK")))
    
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                      message: Text("There was an issue connecting to server"),
                                      dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete the request!"),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidFormData = AlertItem(title: Text("Invalid Form Data"),
                                           message: Text("Please fill out all the fields in the form!"),
                                           dismissButton: .default(Text("OK")))
    
    static let invalidEmail = AlertItem(title: Text("Invalid Email"),
                                           message: Text("Please enter a valid email!"),
                                           dismissButton: .default(Text("OK")))
}

extension AlertContext {
    static func getAlertItem(for error: APError) -> AlertItem {
        switch error {
        case .invalidData:
            return invalidData
        case .invalidResponse:
            return invalidResponse
        case .invalidURL:
            return invalidURL
        case .unableToComplete:
            return invalidURL
        }
    }
}
