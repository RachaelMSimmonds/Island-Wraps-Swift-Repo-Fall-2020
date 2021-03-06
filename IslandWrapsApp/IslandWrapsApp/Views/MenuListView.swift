//
//  MenuListView.swift
//  IslandWrapsApp
//
//  Created by Alex Ketavongsa on 11/11/20.
//

import SwiftUI

struct MenuListView: View {
    @EnvironmentObject var menus: Menus
    @State private var selectedTab = Tabs.order
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemOrange, .font: UIFont(name: "ArialRoundedMTBold", size: 35)!]
        navBarAppearance.titleTextAttributes =  [.foregroundColor: UIColor.systemRed, .font: UIFont(name: "ArialRoundedMTBold", size: 20)!]
        navBarAppearance
            .setBackIndicatorImage(UIImage(systemName: "arrow.turn.up.left"), transitionMaskImage: UIImage(systemName: "arrow.turn.up.left"))
        UINavigationBar.appearance()
            .standardAppearance = navBarAppearance
        UINavigationBar.appearance()
            .scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        UINavigationBar.appearance().backgroundColor = .yellow
        UINavigationBar.appearance().tintColor = .black
    } // End of init
    
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            NavigationView {
               
                    VStack {
                        if menus.list.isEmpty {
                            // could be any view, etc
                            Text("Oops, looks like there's no data...")
                        } else {
                            // List will go here
                            List(menus.list) { m in
                                
                                NavigationLink(destination: MenuDetailView(menu: m, selectedTab: $selectedTab)) {
                                    MenuRow(m:m)
                                }
                            } // List
                        } // else
                    } // VStack
                    .navigationBarTitle(Text("Menu Items"), displayMode: .automatic)
                
            } // NavigationView
        } // End of ZStack
    } // End of Body
} // End of MenuListView

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView()
    }
}

struct MenuRow: View {
    var m: Menu
    
    var body: some View {
            VStack(alignment: .leading) {
                Text("\(m.menuItem)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .font(.title)
            }
    }
    
}

