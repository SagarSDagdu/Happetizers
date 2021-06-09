//
//  APButton.swift
//  Happetizers
//
//  Created by Sagar Dagdu on 09/06/21.
//

import SwiftUI

struct APButton: View {
    let title: LocalizedStringKey
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 280, height: 50)
            .background(Color.brandPrimary)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct APButton_Previews: PreviewProvider {
    static var previews: some View {
        APButton(title: "Test Button")
    }
}
