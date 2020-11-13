//
//  Events.swift
//  IslandWrapsApp
//
//  Created by Alex Ketavongsa on 11/12/20.
//

import Foundation
import CoreLocation

class Events: ObservableObject {
    // Will automatically update the views
    // When value changes, added or deleted, views will be refreshed
    @Published var list: [Event] = []
    @Published var selectedEvent: Event?
    
    init() {
        
        // Load data
         if let path = Bundle.main.path(forResource: "data", ofType: "plist") {
             do {
                 let data = try Data(contentsOf: URL (fileURLWithPath: path))
                 
                 let tempDict = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String : Any]
                 
                 print(tempDict)
                 
                 let tempArray = tempDict["events"]! as! Array<[String:Any]>
                 
                 var tempEvents: [Event] = []
                 
                 for dict in tempArray {
                     print(dict)
                     
                    let eventName = dict["eventName"]! as! String
                    let eventAddress = dict["eventAddress"]! as! String
                    let latitude = dict["latitude"]! as! Double
                    let longitude = dict["longitude"]! as! Double
                     
                     let location = CLLocation(latitude: latitude, longitude: longitude)
                     
                    let e = Event(eventName: eventName, eventAddress: eventAddress, location: location)

                     tempEvents.append(e)
                 }
                 print("There are \(tempEvents.count) events")
                 
                 //_landmarks = State(initialValue: tempLandmarks)
                // Sorted list
                 list = tempEvents.sorted(by: {$0.eventName < $1.eventName})
                print(list)
                 
             } catch {
                 print(error)
             }
         }
        // Not needed
         // return []
    } // End of init
    
} // End of class

