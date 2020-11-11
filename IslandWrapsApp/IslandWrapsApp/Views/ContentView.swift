//
//  ContentView.swift
//  IslandWrapsApp
//
//  Created by Rachael Marie Simmonds on 10/8/20.
//

import SwiftUI

enum Tabs: Hashable {
    case home
    case order
    case events
    case social
    case contact
}

struct ContentView: View {
    @EnvironmentObject var menus: Menus
    @State private var selectedTab = Tabs.home
    @State private var counterNumber = 0
    
    var body: some View {
        Text("This is a test!")
            .padding()
        HStack{
            Button(action: {
                counterNumber += 1

//                    if counterNumber < 10 {
//                        counterNumber += 1
//                    } else if counterNumber >= 10 {
//                        ZStack {
//                            Text("Reduce your count!")
//                                .background(Color.red)
//                                //.padding(.bottom, 40)
//                             }
//                    }
                
            }) {
                Image(systemName: "plus")
                    .font(
                        .system(size: 20, weight:
                            .regular)
                    )
                    .padding(.leading, 50)
                    .padding(.trailing, 50)
                    .padding(.bottom, 50)
                    .padding(.top, 50)
                    .imageScale(.large)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
            } // end of green button
            .offset(x: -10, y: -160)
            // End of green button HStack
    
            Button(action: {
                // action here
                counterNumber -= 1
            }) {
                Image(systemName: "minus")
                    .font(
                        .system(size: 20, weight:
                            .regular)
                    )
                    .padding(.leading, 50)
                    .padding(.trailing, 50)
                    .padding(.bottom, 60)
                    .padding(.top, 60)
                    .imageScale(.large)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10)
            } // end of red button
            .offset(x: 10, y: -160)
        
        }// End of HStack with buttons
        TabView(selection: $selectedTab) {
            
            //MapView()
            Text("Hi")
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
            
            Text("Hi")
            .tabItem {
                Image(systemName: "calendar")
                    Text("Events")
            }
            .tag(Tabs.events)
            
            //AboutView()
            Text("Hi")
            .tabItem {
                Image(systemName: "text.bubble")
                    Text("Social")
            }
            .tag(Tabs.social)
            
            //AboutView()
            Text("Hi")
            .tabItem {
                Image(systemName: "envelope")
                    Text("Contact")
            }
            .tag(Tabs.contact)
    } // End of Tab View
    }//body
}//ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Menus())
    }
}
