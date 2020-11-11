//
//  Menus.swift
//  IslandWrapsApp
//
//  Created by Alex Ketavongsa on 11/11/20.
//

import Foundation

class Menus: ObservableObject {
    // Will automatically update the views
    // When value changes, added or deleted, views will be refreshed
    @Published var list: [Menu] = []
    @Published var selectedMenu: Menu?
    
    init() {
        
        // Load data
         if let path = Bundle.main.path(forResource: "data", ofType: "plist") {
             do {
                 let data = try Data(contentsOf: URL (fileURLWithPath: path))
                 
                 let tempDict = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String : Any]
                 
                 print(tempDict)
                 
                 let tempArray = tempDict["menus"]! as! Array<[String:Any]>
                 
                 var tempMenu: [Menu] = []
                 
                 for dict in tempArray {
                     print(dict)
                     
                    let itemName = dict["itemName"]! as! String
                    let itemPrice = dict["itemPrice"]! as! String
                    
                     
                    let lm = Menu(itemName: itemName, itemPrice: itemPrice)
                     
                     tempMenu.append(lm)
                 }
                 print("There are \(tempMenu.count) menu items")
                 
                // Sorted list
                 list = tempMenu
                 
             } catch {
                 print(error)
             }
         }
        // Not needed
         // return []
    } // End of init
    
} // End of class
