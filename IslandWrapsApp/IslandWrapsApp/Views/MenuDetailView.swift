//
//  MenuDetailView.swift
//  IslandWrapsApp
//
//  Created by Alex Ketavongsa on 11/11/20.
//

import SwiftUI

struct MenuDetailView: View {
    var menu: Menu
    @EnvironmentObject var menus: Menus
    @Binding var selectedTab: Tabs
    
    @State private var showNameInfo = false
    @State private var showStateInfo = false
    
    var body: some View {
        // form
        Form {
            // Item Name
            Section(header: Text("Item Name")
                        .fontWeight(.heavy)
                        .foregroundColor(.blue)) {
                Button("\(menu.itemName)", action: {
                    showStateInfo.toggle()

                })
                
                .foregroundColor(.black)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .sheet(isPresented: $showNameInfo, content: {
                        Text("\(menu.itemName)")
                    })
            }
            // Item Price
            Section(header: Text("Item Price")
                        .fontWeight(.heavy)
                        .foregroundColor(.blue)) {
                Button("\(menu.itemPrice)", action: {
                    showStateInfo.toggle()

                })
                .foregroundColor(.black)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .sheet(isPresented: $showStateInfo, content: {
                        Text("\(menu.itemPrice)")
                    })
            }
            
                .foregroundColor(.black)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        
            //} // Section
        } // form
        .navigationBarTitle("", displayMode: .inline)
    } // body
}

struct MenuDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MenuDetailView(menu: Menus().list.first!, selectedTab: .constant(Tabs.order))
    }
}
