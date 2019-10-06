//
//  ContentView.swift
//  Food ordering App
//
//  Created by Muraino Yakubu on 10/4/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let menu =  Bundle.main.decode([MenuSection].self, from: "menu.json")

    var body: some View {
        NavigationView{
            List{
                ForEach(menu){ biola in
                    
                    Section(header: Text(biola.name)) {
                        ForEach(biola.items){ item in
                              ItemRow(item: item)
                        }
                    }

                }
            }
        .navigationBarTitle("Alamala")
        .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
