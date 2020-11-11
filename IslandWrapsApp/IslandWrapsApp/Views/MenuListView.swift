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
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemRed, .font: UIFont(name: "ArialRoundedMTBold", size: 35)!]
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
    }
    
    
    var body: some View {
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
    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView()
    }
}

struct MenuRow: View {
    var m: Menu
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("\(m.itemName)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .font(.title)
        }
    }
}

