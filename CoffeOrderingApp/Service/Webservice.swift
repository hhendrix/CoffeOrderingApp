//
//  Webservice.swift
//  CoffeOrderingApp
//
//  Created by Harry Lopez on 2/09/22.
//

import Foundation


class WebService {
    
    
    func createCoffeOrder(order:Order, completion: @escaping (CreacionResponse?)-> ()){
        
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            fatalError("invalid URL")
        }
        
        var request = URLRequest(url:url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody =  try? JSONEncoder().encode(order)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.sync {
                    completion(nil)
                }
                return
            }
            
            let creareOrderDesponse = try? JSONDecoder().decode(CreacionResponse.self, from: data)
            DispatchQueue.main.sync {
                completion(creareOrderDesponse)
            }
        }.resume()
        
    }
    
    func getAllOrder(completion: @escaping ([Order]?) -> ()){
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.sync {
                    completion(nil)
                }
                return
            }
            
            let order = try? JSONDecoder().decode([Order].self, from: data)
            DispatchQueue.main.sync {
                completion(order)
            }
            
            
            
        }).resume()
        
    }
    
}
