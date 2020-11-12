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
            // Header with image and title
            Section() {
                Image("\(menu.image)")
                Text("\(menu.menuItem)")
            }
            // Available Items
            Section(header: Text("Available Options")
                        .fontWeight(.heavy)
                        .foregroundColor(.blue)) {
                Text("\(menu.optionOne)")
                Text("\(menu.priceOne)")
                Text("\(menu.descOne)")
            }
            .foregroundColor(.black)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            Section() {
                Text("\(menu.optionTwo)")
                Text("\(menu.priceTwo)")
                Text("\(menu.descTwo)")
            }
            .foregroundColor(.black)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            Section() {
                Text("\(menu.optionThree)")
                Text("\(menu.priceThree)")
                Text("\(menu.descThree)")
            }
            .foregroundColor(.black)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            Section() {
                Text("\(menu.optionFour)")
                Text("\(menu.priceFour)")
                Text("\(menu.descFour)")
            }
            .foregroundColor(.black)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            Section() {
                Text("\(menu.optionFive)")
                Text("\(menu.priceFive)")
                Text("\(menu.descFive)")
            }
            .foregroundColor(.black)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        
        } // form
        .navigationBarTitle("", displayMode: .inline)
    } // body
}

struct MenuDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MenuDetailView(menu: Menus().list.first!, selectedTab: .constant(Tabs.order))
    }
}
