//
//  AddCoffeeOrderView.swift
//  CoffeOrderingApp
//
//  Created by Harry Lopez on 2/09/22.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    
    @ObservedObject private var addCoffeOrderVM = AddCaffeeOrderViewModel()
    @Binding  var isPresented:Bool
    
    var body: some View {
        NavigationView{
            
            
            
            VStack{
                Form{
                    Section(header: Text("INFORMATION").font(.body)) {
                        TextField("Enter Name", text: self.$addCoffeOrderVM.name)
                    }
                    
                    Section(header:Text("SELECT COFFEE").font(.body)){
                        ForEach(addCoffeOrderVM.coffeList, id: \.name){ coffee in
                            CoffeCellView(coffee: coffee, selection: self.$addCoffeOrderVM.coffeName)
                            
                            
                        }
                    }
                    
                    Section(header:Text("SELECT COFFEE").font(.body), footer: OrderTotalView(total: self.addCoffeOrderVM.total)){
                        Picker("", selection: self.$addCoffeOrderVM.size){
                            Text("Small").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Large").tag("Large")
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                HStack{
                    Button("Place Order"){
                        self.addCoffeOrderVM.placeOrder()
                        self.isPresented = false
                    }
                }.padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100))
                    .foregroundColor(.white)
                    .background(Color(red: 46/255, green: 204/255, blue: 113/255, opacity: 1.0))
                    .cornerRadius(10)
            }
            
            .navigationBarTitle("Add Order")
        }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView(isPresented: .constant(false))
    }
}

struct CoffeCellView: View {
    
    let coffee : CoffeViewModel
    @Binding var selection: String
    
    var body: some View {
        HStack{
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)
            Text(coffee.name)
                .font(.title)
                .padding([.leading], 20)
            Spacer()
            Image(systemName: self.selection == self.coffee.name ? "checkmark" : "").padding()
        }.onTapGesture {
            self.selection = self.coffee.name
        }
    }
}
