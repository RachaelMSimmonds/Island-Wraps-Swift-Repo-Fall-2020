//
//  Menu.swift
//  IslandWrapsApp
//
//  Created by Alex Ketavongsa on 11/11/20.
//

import Foundation
import MapKit

class Menu: NSObject, Identifiable {
    
    var itemName : String = ""
    var itemPrice : String = ""


//designated initializers
init(itemName: String, itemPrice: String) {
   super.init()
   self.itemName = itemName
   self.itemPrice = itemPrice

    
    UISegmentedControl.appearance().selectedSegmentTintColor = .blue
    UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.blue], for: .normal)
    UISegmentedControl.appearance().backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    }
    
    override convenience init() {
       self.init(itemName: " Unknown", itemPrice: " Unknown")
    }
    
    func getItemName() -> String {
        itemName
    }
    
    func set(name: String) {
        itemName = name
    }
    
    func getItemPrice() -> String {
        itemPrice
    }
    
    func set(price: String) {
        itemPrice = price
    }

}//end Menu class

extension Menu {
    static func all() -> [Menu] {
    //load data
    if let path = Bundle.main.path(forResource: "data", ofType: "plist") {
do {
    let data = try Data(contentsOf: URL(fileURLWithPath: path))
    let tempDict = try PropertyListSerialization.propertyList(from: data,format: nil) as! [String:Any]
    let tempArray = tempDict["menu"] as! Array<[String:Any]>
        var tempMenu: [Menu] = []

    for dict in tempArray {
        let itemName = dict["itemName"]! as! String
        let itemPrice = dict["itemPrice"]! as! String


        let m = Menu(itemName: itemName, itemPrice: itemPrice)
        tempMenu.append(m)
    }

    //check to see if the menu items were created correctly
    for m in tempMenu {
        print("Menu Item: \(m)")
    }
    return tempMenu;

    } catch {
    print(error)
    }
    }
    return []
  }//func
}//extension

