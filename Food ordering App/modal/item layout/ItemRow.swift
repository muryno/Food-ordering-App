//
//  ItemRow.swift
//  Food ordering App
//
//  Created by Muraino Yakubu on 10/5/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    let item : MenuItem

    
    static let colors : [String : Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    
    var body: some View {
        
        NavigationLink(destination: ItemDetails(item: item)) {
                HStack{
                        Image(item.thumbnailImage)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray, lineWidth: 2))

                    VStack(alignment: .leading, spacing: 2){
                        Text(item.name)
                            .font(.headline)
                            
                        Text(String(item.numberFormatted())).font(.caption)

                        }.layoutPriority(1)
                    Spacer()
                    ForEach(item.restrictions , id: \.self){ restrictions in
                        Text(restrictions)
                            .font(.caption)
                            .fontWeight(.black)
                            .padding(5)

                            .background(Self.colors[restrictions , default:  .black])
                            .foregroundColor(.white)
                            .clipShape(Circle())
                
                    }
                }
        }
        
    }}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
