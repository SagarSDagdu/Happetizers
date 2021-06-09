//
//  AccountView.swift
//  Happetizers
//
//  Created by Sagar Dagdu on 05/06/21.
//

import SwiftUI

struct AccountView: View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var birthday = Date()
    
    @State var extraNapkins = false
    @State var frequentRefills = false
    
    var body: some View {
        NavigationView {
            
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
                    Button {
                        print("save")
                    } label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $extraNapkins)
                    Toggle("Frequent Refills", isOn: $frequentRefills)
                }.toggleStyle(SwitchToggleStyle(tint: Color.brandPrimary))
            }.navigationTitle("℀ Account")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
