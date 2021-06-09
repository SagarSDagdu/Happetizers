//
//  AppetizerDetailView.swift
//  Happetizers
//
//  Created by Sagar Dagdu on 09/06/21.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        VStack {
            Image("asian-flank-steak")
                .resizable()
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
                Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 280, height: 50)
                    .background(Color.brandPrimary)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }.padding()
        }
        .frame(width: 300, height: 600, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 20)
        .overlay(Button(action: {
            
        }, label: {
            ZStack {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .opacity(0.6)
                Image(systemName: "xmark")
                    .frame(width: 40, height: 40)
                    .imageScale(.small)
                    .foregroundColor(.black)
            }
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
        AppetizerDetailView(appetizer: MockData.mockAppetizers().first!)
    }
}
