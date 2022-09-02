//
//  AddCaffeeOrderViewModel.swift
//  CoffeOrderingApp
//
//  Created by Harry Lopez on 2/09/22.
//

import Foundation

class AddCaffeeOrderViewModel : ObservableObject {
    
    private var webservice : WebService
    
    var name : String = ""
    @Published var size: String = "Medium"
    @Published var coffeName: String = ""
    
    
    var coffeList : [CoffeViewModel] {
        Coffee.all().map(CoffeViewModel.init)
    }
    
    var total : Double {
        return calculateTotalPrice()
    }
    
    init(){
        self.webservice = WebService()
    }
    
    
    // MARK: - Functions
    private func calculateTotalPrice() -> Double {
        let coffeeVM = coffeList.first{ $0.name == coffeName}
        if let coffeeVM = coffeeVM {
            return coffeeVM.price * priceForSize()
        }else {
            return 0.0
        }
    }
    
    private func priceForSize() -> Double{
        let prices = ["Small":2.0, "Medium":3.0, "Large":4.0]
        return prices[self.size]!
    }
    
    func placeOrder(){
        
        let order = Order(name: self.name, size: self.size, coffeeName: self.coffeName, total: self.total)
        self.webservice.createCoffeOrder(order: order) { _ in
            
        }
    }
    
    
}
