//
//  AppetizerDetailView.swift
//  Happetizers
//
//  Created by Sagar Dagdu on 09/06/21.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    let appetizer: Appetizer
    
    @Binding var isDetailVisible: Bool
    
    var body: some View {
        VStack {
            AppetizerImageView(url: appetizer.imageURL)
                .frame(width: 300, height: 250)
                .aspectRatio(contentMode: .fit)
            Text(appetizer.name)
                .font(.title2)
                .fontWeight(.semibold)
            Text(appetizer.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
            HStack(spacing: 40) {
                NutritionView(title: "Calories", subtitle: "\(appetizer.calories)")
                NutritionView(title: "Carbs", subtitle: "\(appetizer.carbs)")
                NutritionView(title: "Protein", subtitle: "\(appetizer.protein)")
            }
            Spacer()
            Button {
                
            } label: {
                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
            }.padding()
        }
        .frame(width: 300, height: 600, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 20)
        .overlay(Button(action: {
            isDetailVisible = false
        }, label: {
            XDismissButton()
        }), alignment: .topTrailing)
    }
}

struct NutritionView: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.caption)
                .bold()
            Text(subtitle)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.mockAppetizers().first!, isDetailVisible: .constant(true))
    }
}
