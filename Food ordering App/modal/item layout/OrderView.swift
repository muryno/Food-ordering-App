//
//  OrderView.swift
//  Food ordering App
//
//  Created by Muraino Yakubu on 10/6/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order : Order
    @State private var userName: String = ""

    var body: some View {

        NavigationView{
            List{
                Section{
                    ForEach(order.items){ items in
                        HStack{
                            Text(items.name)
                            Spacer()
                            Text(String(items.numberFormatted()))
                        }
                    }
                }
                Section {
                    NavigationLink(destination: Text("Check out")) {
                        Text("Place Order")
                    }
                    
                }
                
//                ZStack {
//                    VStack{
//                        Rectangle()
//                            .fill(Color.green)
//                            .frame(width: 20, height: 20)
//
//                        Rectangle()
//                                                  .fill(Color.black)
//                                                  .frame(width: 20, height: 20)
//
//                    }   .zIndex(2)
//                    Rectangle()
//                      .fill(Color.yellow)
//                                       .frame(width: 50, height: 50)
//                                       .zIndex(1)
//                    Circle()
//                        .fill(Color.red)
//                        .frame(width: 100, height: 100)
//                }
                
//                TextField($userName, placeholder: Text("type here"))

            }
        }.navigationBarTitle("Order")
            .listStyle(GroupedListStyle())
    }
}

struct OrderView_Previews: PreviewProvider {
    static var order = Order()
    static var previews: some View {
        OrderView()
        .environmentObject(order)
    }
}
