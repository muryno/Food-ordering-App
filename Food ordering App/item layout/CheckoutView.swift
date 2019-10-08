//
//  CheckoutView.swift
//  Food ordering App
//
//  Created by Muraino Yakubu on 10/7/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order : Order
    static let paymentTypes = ["Cash","Pos","Pay-stack", "Interswift"]
    @State private var paymentType = 0
    
    @State var confirmAmount = false
     var utils = Utils()
    
    var prices : Int{
        let price = Double(order.total)
        let cummulator = (price/100) * Double(Self.tipAmounts[tipAmount])
        let total = price + cummulator
        return Int(total)
    }

    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    
    static let tipAmounts = [10, 15, 20, 25, 0]

    @State private var tipAmount = 1
    
    var body: some View {
        
        Form{
            Section{
                    Picker("How do you want to pay?", selection: $paymentType) {
                        ForEach(0 ..< Self.paymentTypes.count){
                            Text(Self.paymentTypes[$0])

                        }
                    }
                
                    Toggle(isOn: $addLoyaltyDetails.animation()) {
                        Text("Add loyalty card")
                    }
                    if addLoyaltyDetails{
                        TextField("Enter your loyality ID", text: $loyaltyNumber)
                    }
                
            }
          

            Section(header: Text("Add a trips? ") ){

                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
                //WheelPickerStyle
            }

            Section(header:
                Text("TOTAL: \(  utils.getCurrency(price : prices) )")
                    .font(.largeTitle)
            ) {
                Button("Confirm order") {
                    self.confirmAmount.toggle()
                  
                }
            }
            
        }.navigationBarTitle(Text("Payment"), displayMode: .inline)
            .alert(isPresented: $confirmAmount) { () -> Alert in
                Alert(title: Text("Order confirmed"), message: Text("Your total was \(utils.getCurrency(price : prices)) – thank you!"), dismissButton: .default(Text("Ok")))
        }

        
       
        
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
