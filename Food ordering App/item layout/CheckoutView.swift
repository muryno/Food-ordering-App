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
    
     var utils = Utils()

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
                Text("TOTAL: \(  utils.getCurrency(price : order.total) )")
            ) {
                Button("Confirm order") {
                    // place the order
                  
                }
            }
            
        }.navigationBarTitle(Text("Payment"), displayMode: .inline)

        
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
