//
//  OrderListViewModel.swift
//  CoffeOrderingApp
//
//  Created by Harry Lopez on 2/09/22.
//

import Foundation
class OrderListViewModel : ObservableObject {
    
    @Published var orders = [OrderViewModel]()
    
    init(){
        fetchOrders()
    }
    
    func fetchOrders(){
        WebService().getAllOrder { orders in
            if let order = orders {
                self.orders = order.map(OrderViewModel.init)
            }
        }
    }
    
}


class OrderViewModel {
    
    var order: Order
    
    init(order: Order){
        self.order = order
    }
    
    var id = UUID()
    
    var name:String {
        return self.order.name
    }
    
    var size:String {
        return self.order.size
    }
    
    var coffeName:String {
        return self.order.coffeeName
    }
    
    var total:Double {
        return self.order.total
    }
    
}
