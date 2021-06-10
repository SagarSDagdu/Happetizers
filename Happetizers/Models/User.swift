//
//  User.swift
//  Happetizers
//
//  Created by Sagar Dagdu on 10/06/21.
//

import Foundation

struct User: Codable {
    var firstName: String
    var lastName: String
    var email: String
    var birthday: Date
    var extraNapkins = false
    var frequentRefills = false
}
