//
//  AppetizerListView.swift
//  Happetizers
//
//  Created by Sagar Dagdu on 05/06/21.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var appetizerListViewModel = AppetizerListViewModel()
    
    @State var selectedAppetizer: Appetizer?
    
    @State var isDetailViewOpened = false
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(appetizerListViewModel.appetizers) { appetizer in
                        AppetizerListCell(appetizer: appetizer).onTapGesture {
                            isDetailViewOpened = true
                            selectedAppetizer = appetizer
                        }
                    }
                }.navigationTitle("🍗 Appetizers")
            }.onAppear() {
                appetizerListViewModel.getAppetizers()
            }
            .disabled(isDetailViewOpened)
            .blur(radius: isDetailViewOpened ? 20 : 0)
            
            if appetizerListViewModel.isLoading {
                LoadingView()
            }
            
            if isDetailViewOpened {
                AppetizerDetailView(appetizer: selectedAppetizer!, isDetailVisible: $isDetailViewOpened)
            }
            
        }.alert(item: $appetizerListViewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
