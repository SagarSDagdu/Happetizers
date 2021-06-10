//
//  OrderView.swift
//  Happetizers
//
//  Created by Sagar Dagdu on 05/06/21.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.appetizers) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }.onDelete(perform: deleteItems)
                    }.listStyle(PlainListStyle())
                    
                    Button {
                        
                    } label: {
                        APButton(title: "$\(order.total, specifier: "%.2f") - Place Order")
                    }.padding(.bottom, 25)
                }
                
                if order.appetizers.isEmpty {
                    EmptyState(imageName: "empty-order", message: "No order 😞")
                }
                
            }
            .navigationTitle("🛒 Order")
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        order.remove(at: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
