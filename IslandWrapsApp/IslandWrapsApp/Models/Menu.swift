//
//  Menu.swift
//  IslandWrapsApp
//
//  Created by Alex Ketavongsa on 11/11/20.
//

import Foundation
import MapKit

class Menu: NSObject, Identifiable {
    
    var menuItem : String = ""
    var image : String = ""
    
    var optionOne : String = ""
    var priceOne : String = ""
    var descOne : String = ""
    
    var optionTwo : String = ""
    var priceTwo : String = ""
    var descTwo : String = ""
    
    var optionThree : String = ""
    var priceThree : String = ""
    var descThree : String = ""
    
    var optionFour : String = ""
    var priceFour : String = ""
    var descFour : String = ""
    
    var optionFive : String = ""
    var priceFive : String = ""
    var descFive : String = ""


//designated initializers
    init(menuItem: String, image: String,
         optionOne: String, priceOne: String, descOne: String,
         optionTwo: String, priceTwo: String, descTwo: String,
         optionThree: String, priceThree: String, descThree: String,
         optionFour: String, priceFour: String, descFour: String,
         optionFive: String, priceFive: String, descFive: String) {
        super.init()
        self.menuItem = menuItem
        self.image = image
    
        self.optionOne = optionOne
        self.priceOne = priceOne
        self.descOne = descOne
        
        self.optionTwo = optionTwo
        self.priceTwo = priceTwo
        self.descTwo = descTwo
        
        self.optionThree = optionThree
        self.priceThree = priceThree
        self.descThree = descThree
        
        self.optionFour = optionFour
        self.priceFour = priceFour
        self.descFour = descFour
        
        self.optionFive = optionFive
        self.priceFive = priceFive
        self.descFive = descFive
    
    

    
    UISegmentedControl.appearance().selectedSegmentTintColor = .blue
    UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.blue], for: .normal)
    UISegmentedControl.appearance().backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    }
    
    override convenience init() {
       self.init(menuItem: " unknown", image: " unknown",
                 optionOne: " unknown", priceOne: " unknown", descOne: " unknown",
                 optionTwo: " unknown", priceTwo: " unknown", descTwo: " unknown",
                 optionThree: " unknown", priceThree: " unknown", descThree: " unknown",
                 optionFour: " unknown", priceFour: " unknown", descFour: " unknown",
                 optionFive: " unknown", priceFive: " unknown", descFive: " unknown")
    }
    // MenuItem and Image
    func getmenuItem() -> String {
        menuItem
    }
    func set(menu: String) {
        menuItem = menu
    }
    func getImage() -> String {
        image
    }
    func set(img: String) {
        image = img
    }
    
    // Option 1 and price 1 and desc 1
    func getOptionOne() -> String {
        optionOne
    }
    func set(op1: String) {
        optionOne = op1
    }
    func getPriceOne() -> String {
        priceOne
    }
    func set(p1: String) {
        priceOne = p1
    }
    func getDescOne() -> String {
        descOne
    }
    func set(d1: String) {
        descOne = d1
    }
    
    // Option 2 and price 2 and desc 2
    func getOptionTwo() -> String {
        optionTwo
    }
    func set(op2: String) {
        optionTwo = op2
    }
    func getPriceTwo() -> String {
        priceTwo
    }
    func set(p2: String) {
        priceTwo = p2
    }
    func getDescTwo() -> String {
        descTwo
    }
    func set(d2: String) {
        descTwo = d2
    }
    
    // Option 3 and price 3 and desc 3
    func getOptionThree() -> String {
        optionThree
    }
    func set(op3: String) {
        optionThree = op3
    }
    func getPriceThree() -> String {
        priceThree
    }
    func set(p3: String) {
        priceThree = p3
    }
    func getDescThree() -> String {
        descThree
    }
    func set(d3: String) {
        descThree = d3
    }
    
    // Option 4 and price 4 and desc 4
    func getOptionFour() -> String {
        optionFour
    }
    func set(op4: String) {
        optionFour = op4
    }
    func getPriceFour() -> String {
        priceFour
    }
    func set(p4: String) {
        priceFour = p4
    }
    func getDescFour() -> String {
        descFour
    }
    func set(d4: String) {
        descFour = d4
    }

    // Option 5 and price 5 and desc 5
    func getOptionFive() -> String {
        optionFive
    }
    func set(op5: String) {
        optionFive = op5
    }
    func getPriceFive() -> String {
        priceFive
    }
    func set(p5: String) {
        priceFive = p5
    }
    func getDescFive() -> String {
        descFive
    }
    func set(d5: String) {
        descFive = d5
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


        let m = Menu(menuItem: menuItem, image: image,
                     optionOne: optionOne, priceOne: priceOne, descOne: descOne,
                     optionTwo: optionTwo, priceTwo: priceTwo, descTwo: descTwo,
                     optionThree: optionThree, priceThree: priceThree, descThree: descThree,
                     optionFour: optionFour, priceFour: priceFour, descFour: descFour,
                     optionFive: optionFive, priceFive: priceFive, descFive: descFive)
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

