//
//  Cart.swift
//  IslandWrapsApp
//
//  Created by Rachael Marie Simmonds on 11/29/20.
//
// THIS IS NOT BEING USED

import SwiftUI

struct Cart: Identifiable {
    
    var id = UUID().uuidString
    var menuItem : Menu
    var quantity : Int
}
