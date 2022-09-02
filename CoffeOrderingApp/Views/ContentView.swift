//
//  ContentView.swift
//  CoffeOrderingApp
//
//  Created by Harry Lopez on 2/09/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var orderListViewModel  = OrderListViewModel()
    
    @State private var showModal: Bool = false
    
    init(){
        UINavigationBar.appearance().backgroundColor = UIColor(displayP3Red: 165/255, green: 94/255, blue: 234/255, alpha: 1.0)
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    }
    
    var body: some View {
        NavigationView{
            
            OrderListView(orders: self.orderListViewModel.orders)
            
                .navigationTitle("Coffee Orders")
                .navigationBarItems(leading: Button(action: reloadOrders, label: {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(.white)
                }), trailing: Button(action: showAddCoffeeOrderView, label: {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                }))
            
            
            
                .sheet(isPresented: self.$showModal) {
                    AddCoffeeOrderView(isPresented:self.$showModal)
                }
        }
    }
    
    
    private func reloadOrders(){
        self.orderListViewModel.fetchOrders()
    }
    
    private func showAddCoffeeOrderView(){
        self.showModal = true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
