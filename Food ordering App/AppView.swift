//
//  AppView.swift
//  Food ordering App
//
//  Created by Muraino Yakubu on 10/6/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView{
      
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
            }
            OrderView()
                .tabItem{
                    Image(systemName: "square.and.pencil")
                    Text("Order")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let order = Order()

    static var previews: some View {
        AppView().environmentObject(order)
    }
}
