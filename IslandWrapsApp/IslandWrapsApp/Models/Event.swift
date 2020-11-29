//
//  Event.swift
//  IslandWrapsApp
//
//  Created by Alex Ketavongsa on 11/12/20.
//
import Foundation
import CoreLocation
import MapKit

class Event: NSObject, MKAnnotation, Identifiable {
    var id = UUID()
    var eventName : String = ""
    var eventAddress : String = ""
    var location : CLLocation?
    
    //needed for the MKAnnotation protocol
    var coordinate: CLLocationCoordinate2D {
        get {
            return location!.coordinate
        }
    }
    override var description : String {
        return "{\n\t Event Name: \(eventName)\n\t Address: \(eventAddress)\n\t Location: \(String(describing: location))\n}"
    }
    
    init(eventName: String, eventAddress: String, location: CLLocation) {
        //super.init()
        self.eventName = eventName
        self.eventAddress = eventAddress
        self.location = location
        
//        UISegmentedControl.appearance().selectedSegmentTintColor = .blue
//        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
//        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.blue], for: .normal)
//        UISegmentedControl.appearance().backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }//end init
    
    //optional - required with set callout true
    var title : String? {
        get {
            return eventName
        }
    }
    
   var subtitle : String? {
        get {
            return eventAddress
        }
    }
    
    func geteventName() -> String {
        eventName
    }
    func set(name: String) {
        eventName = name
    }

    func geteventAddress() -> String {
        eventAddress
    }
    func set(address: String) {
        eventAddress = address
    }


}//end Event class

//extension Event {
//    static func all() -> [Event] {
//    //load data
//    if let path = Bundle.main.path(forResource: "data", ofType: "plist") {
//do {
//    let data = try Data(contentsOf: URL(fileURLWithPath: path))
//    let tempDict = try PropertyListSerialization.propertyList(from: data,format: nil) as! [String:Any]
//    let tempArray = tempDict["events"] as! Array<[String:Any]>
//        var tempEvent: [Event] = []
//
//    for dict in tempArray {
//
//        let eventName = dict["eventName"]! as! String
//        let eventAddress = dict["eventAddress"]! as! String
//        let latitude = dict["latitude"]! as! Double
//        let longitude = dict["longitude"]! as! Double
//
//        let location = CLLocation(latitude: latitude, longitude: longitude)
//
//
//        let e = Event(eventName: eventName, eventAddress: eventAddress, location: location)
//
//        tempEvent.append(e)
//    }
//
//    //check to see if the events were created correctly
//    for e in tempEvent {
//        print("Events: \(e)")
//    }
//    return tempEvent;
//
//    } catch {
//    print(error)
//    }
//    }
//    return []
//  }//func
//}//extension


