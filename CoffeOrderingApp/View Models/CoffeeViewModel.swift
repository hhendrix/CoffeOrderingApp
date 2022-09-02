//
//  CoffeeViewModel.swift
//  CoffeOrderingApp
//
//  Created by Harry Lopez on 2/09/22.
//

import Foundation

class CoffeeLIstViewModel {
    var coffeeList: [CoffeViewModel] = [CoffeViewModel]()
}


struct CoffeViewModel {
    
    var  coffee: Coffee
    
    
    init(coffee:Coffee){
        self.coffee = coffee
    }
    
    var name: String {
        self.coffee.name
    }
    
    var imageURL: String {
        self.coffee.imageURL
    }
    
    var price: Double {
        self.coffee.price
    }
    
}
