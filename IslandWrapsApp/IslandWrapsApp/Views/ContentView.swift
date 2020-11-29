//
//  ContentView.swift
//  IslandWrapsApp
//
//  Created by Rachael Marie Simmonds on 10/8/20.
//

import SwiftUI
import MapKit

enum Tabs: Hashable {
    case home
    case order
    case events
    case social
    case contact
  //  case cart
}

struct ContentView: View {
    @EnvironmentObject var menus: Menus
    @EnvironmentObject var events: Events
    @State private var selectedTab = Tabs.home
    @State private var counterNumber = 0
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            HomeView()
            .tabItem {
                Image(systemName: "house")
                    Text("Home")
            }
            .tag(Tabs.home)
            
            MenuListView()
            .tabItem {
                Image(systemName: "bag")
                    Text("Order")
            }
            .tag(Tabs.order)
            
            MyMapTab()
            .tabItem {
                Image(systemName: "calendar")
                    Text("Events")
            }
            .tag(Tabs.events)
            
            SocialView()
            .tabItem {
                Image(systemName: "text.bubble")
                    Text("Social")
            }
            .tag(Tabs.social)
            
            ContactView()
            .tabItem {
                Image(systemName: "envelope")
                    Text("Contact")
            }
            .tag(Tabs.contact)
            
//            CartView()
//                .tabItem {
//                    Image(systemName: "cart")
//                    Text("Cart")
//                }
    } // End of Tab View
    }//body
}//ContentView

extension ContentView {
    //Path to device setting if location is disabled
    func goToDeviceSettings() {
        guard let url = URL.init(string: UIApplication.openSettingsURLString) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Events())
            .environmentObject(Menus())

    }
}
