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
                 
                 let tempArray = tempDict["menu"]! as! Array<[String:Any]>
                 
                 var tempMenu: [Menu] = []
                 
                 for dict in tempArray {
                     print(dict)
                     
                    let menuItem = dict["menuItem"]! as! String
                    let image = dict["image"]! as! String
                    let optionOne = dict["optionOne"]! as! String
                    let priceOne = dict["priceOne"]! as! String
                    let descOne = dict["descOne"]! as! String
                    let optionTwo = dict["optionTwo"]! as! String
                    let priceTwo = dict["priceTwo"]! as! String
                    let descTwo = dict["descTwo"]! as! String
                    let optionThree = dict["optionThree"]! as! String
                    let priceThree = dict["priceThree"]! as! String
                    let descThree = dict["descThree"]! as! String
                    let optionFour = dict["optionFour"]! as! String
                    let priceFour = dict["priceFour"]! as! String
                    let descFour = dict["descFour"]! as! String
                    let optionFive = dict["optionFive"]! as! String
                    let priceFive = dict["priceFive"]! as! String
                    let descFive = dict["descFive"]! as! String
                    
                     
                    let lm = Menu(menuItem: menuItem, image: image,
                                  optionOne: optionOne, priceOne: priceOne, descOne: descOne,
                                  optionTwo: optionTwo, priceTwo: priceTwo, descTwo: descTwo,
                                  optionThree: optionThree, priceThree: priceThree, descThree: descThree,
                                  optionFour: optionFour, priceFour: priceFour, descFour: descFour,
                                  optionFive: optionFive, priceFive: priceFive, descFive: descFive)
                     
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
