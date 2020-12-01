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
    
    // Environment Objects
    @EnvironmentObject var menus: Menus
    @EnvironmentObject var events: Events
    
    // State Variables
    @State private var selectedTab = Tabs.home
    @State private var counterNumber = 0
    @State private var locationManager = CLLocationManager()
    @State private var showMapAlert = false
    @State private var selectedSegment = 0
    @State private var mapSelect = [MapTypeSelect(title: "Standard", map: .standard), MapTypeSelect(title: "Satellite", map: .satellite), MapTypeSelect(title: "Hybrid", map: .hybrid)]
    @State private var zoomed = false
    
    // Init for the map type segmented controls
    init() {
        // UISegmentedControls
        UISegmentedControl
            .appearance()
                .selectedSegmentTintColor = .blue
        UISegmentedControl
            .appearance()
                .setTitleTextAttributes(
                    [.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl
            .appearance()
                .setTitleTextAttributes(
                    [.foregroundColor: UIColor.blue], for: .normal)
        UISegmentedControl
            .appearance()
            .backgroundColor =  #colorLiteral(
                    red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    } // End of init
    
    // Function for updating the map
    func startUpdating() {
        locationManager.startUpdatingLocation()
    }
    
    // The body
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
            
            //MyMapTab()
            ZStack {
                HStack {
                    MapView(events: $events.list, locationManager: $locationManager, showMapAlert: $showMapAlert, mapType: mapSelect[selectedSegment].map, zoomed: $zoomed)
                        .edgesIgnoringSafeArea(.all)
                }
                    HStack {
                        Button(action: {
                            zoomed = false
                            self.startUpdating()
                           
                        }) {
                            Image(systemName: "arrow.down.right.and.arrow.up.left")
                                .font(
                                    .system(size: 20, weight:
                                        .regular))
                        }
                        .padding(3)
                        .background(Color.blue)
                        .foregroundColor(.white)
                    
                        Button(action: {
                            // self.stop()
                            zoomed = true
                            startUpdating()
                        }) {
                            Image(systemName: "arrow.up.left.and.arrow.down.right")
                                .font(
                                    .system(size: 20, weight:
                                        .regular))
                        }
                        .padding(3)
                        .background(Color.blue)
                        .foregroundColor(.white)
                    } // Hstack
                    .frame(width: 0, height: 100, alignment: .leading)
                    .offset(x: -160, y: -250)
                    
              
                Picker(selection: $selectedSegment, label: EmptyView()) {
                    ForEach(0 ..< mapSelect.count) {
                        Text(self.mapSelect[$0].title).tag($0)
                    
                    }
                
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 200, height: 100, alignment: .trailing)
                .offset(x: 80, y: -250)
        }
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
