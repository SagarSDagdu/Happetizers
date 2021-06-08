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
    
    static func getAlertItem(for error: APError) -> AlertItem {
        switch error {
        case .invalidData:
            return AlertItem(title: Text("Server Error"), message: Text("The data received from the server is invalid!"), dismissButton: .default(Text(
            "OK")))
        case .invalidResponse:
            return AlertItem(title: Text("Server Error"), message: Text("The response received from the server is invalid!"), dismissButton: .default(Text(
            "OK")))
        case .invalidURL:
            return AlertItem(title: Text("Server Error"), message: Text("There was an issue connecting to server"), dismissButton: .default(Text(
            "OK")))
        case .unableToComplete:
            return AlertItem(title: Text("Server Error"), message: Text("Unable to complete the request!"), dismissButton: .default(Text(
            "OK")))
        }
    }
}
