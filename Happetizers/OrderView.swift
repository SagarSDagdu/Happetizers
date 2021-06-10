//
//  OrderView.swift
//  Happetizers
//
//  Created by Sagar Dagdu on 05/06/21.
//

import SwiftUI

struct OrderView: View {
    
    @State var orderedAppetizers: [Appetizer]
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(orderedAppetizers) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }.onDelete(perform: deleteItems)
                    }.listStyle(PlainListStyle())
                    
                    Button {
                        
                    } label: {
                        APButton(title: "Order")
                    }.padding(.bottom, 25)
                }
                
                if orderedAppetizers.isEmpty {
                    EmptyState(imageName: "empty-order", message: "No order 😞")
                }
                
            }
            .navigationTitle("🛒 Order")
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        orderedAppetizers.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(orderedAppetizers: Array(MockData.mockAppetizers()[0...3]))
    }
}
