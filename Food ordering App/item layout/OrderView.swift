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
    var utils = Utils()

    var body: some View {

        NavigationView{
            List{
                Section{
                    ForEach(order.items){ items in
                        HStack{
                            Text(items.name)
                            Spacer()
                            Text(self.utils.getCurrency(price : self.order.total))
                        }
                    }.onDelete(perform: deleteItem)
                }
                Section {
                    NavigationLink(destination: CheckoutView()) {
                        Text("Place Order")
                    }
                    
                }.disabled(order.items.isEmpty)
                


            }.navigationBarTitle(Text("Order"), displayMode: .inline)
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing:  EditButton())
            //to edit item
            //SwiftUI already knows that an edit button should toggle the table between editing and non-editing mode, while also changing title between Edit and Done – another example of us getting the system default behavior for free.
        }

    }
    
    func deleteItem(at ofset : IndexSet){
        order.items.remove(atOffsets: ofset)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var order = Order()
    static var previews: some View {
        OrderView()
        .environmentObject(order)
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
