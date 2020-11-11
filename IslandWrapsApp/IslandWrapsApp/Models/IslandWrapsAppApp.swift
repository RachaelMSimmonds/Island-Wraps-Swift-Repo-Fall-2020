//
//  IslandWrapsAppApp.swift
//  IslandWrapsApp
//
//  Created by Rachael Marie Simmonds on 10/8/20.
//

import SwiftUI

@main
struct IslandWrapsAppApp: App {
    var menus = Menus()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(menus)

        }
    }
}
