//
//  ItemDetails.swift
//  Food ordering App
//
//  Created by Muraino Yakubu on 10/5/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import SwiftUI

struct ItemDetails: View {
    
    @EnvironmentObject var order:Order
    let item : MenuItem
    var body: some View {
        
        VStack{
            ZStack(alignment: .bottomTrailing){
            Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                .padding(4)
                    .background(Color.black)
                    .font(.caption)
                      .foregroundColor(.white)
                .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
                .font(Font.system(size: 15))
                
            Button(action: {
                self.order.add(item: self.item)
                
            }, label: {
                 Text("Order item")
                    .frame(width: 120, height: 25, alignment: .center)
                .padding(5)
                .font(.system(size: 10))
                .background(Color.green)
                         .foregroundColor(Color.white)
                         .cornerRadius(5)
            })
         
            Spacer()

        }.navigationBarTitle(Text(item.name) , displayMode: .inline)
        
    }
}

struct ItemDetails_Previews: PreviewProvider {
    static var order = Order()
    static var previews: some View {
        ItemDetails(item: MenuItem.example)
        .environmentObject(order)
    }
}
