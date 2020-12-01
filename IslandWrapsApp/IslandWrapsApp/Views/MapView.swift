//
//  MapView.swift
//  IslandWrapsApp
//
//  Created by Rachael Marie Simmonds on 11/30/20.
//


import Foundation
import SwiftUI
import MapKit
import CoreLocation

// conform protocol
struct MapView: UIViewRepresentable {
    
    @Binding var events: [Event]
    @Binding var locationManager: CLLocationManager
    @Binding var showMapAlert: Bool
    var mapType: MKMapType
    @Binding var zoomed: Bool

    
    let mapView = MKMapView()
    
    
    func makeUIView(context: Context) -> MKMapView {
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.delegate = context.coordinator
        mapView.delegate = context.coordinator
        
        if zoomed {
            zoomOut()
        }
        
        return mapView
    }
    
    func stopUpdating() {
        locationManager.stopUpdatingLocation()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.showsUserLocation = true
        
        uiView.mapType = mapType
        
        
        //   let np = NorthPole()
            // uiView.addAnnotation(np)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func zoomOut() {
        mapView.showAnnotations(events, animated: true)
        
    }
    
    class Coordinator: NSObject, MKMapViewDelegate, CLLocationManagerDelegate {
        
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        //MARK: - MapViewDelegate Protocol Methods
       
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            print(mapView.centerCoordinate)
        }
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            mapView.addAnnotations(parent.events)
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            let annotation = view.annotation
            print("The title of the annotation is: \(String(describing: annotation?.title))")
        }
        
        // Called for every annotation that's created
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            var view: MKPinAnnotationView
            let identifier = "Pin"
            
            if annotation is MKUserLocation {
                return nil //so uses default view
            }
            
            if annotation !== mapView.userLocation {
                // look for an existing view to reuse
                if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
                    dequeuedView.annotation = annotation
                    view = dequeuedView
                    
                } else {
                    view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                    // set some properties
                    view.pinTintColor = MKPinAnnotationView.purplePinColor()
                    view.animatesDrop = true
                    view.canShowCallout = true
                    
                    // Buttons for callout
                    let leftButton = UIButton(type: .infoLight)
                    //let rightButton = UIButton(type: .detailDisclosure)
                    
                    leftButton.tag = 0
                    //rightButton.tag = 1
                    
                    view.leftCalloutAccessoryView = leftButton
                    //view.rightCalloutAccessoryView = rightButton
                }
                return view
            }
            return nil
        }
        
       
        
//        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//
//            print("Control tapped: \(control), tag: \(control.tag)")
//        }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            let parkAnnotation = view.annotation as! Event
            switch control.tag {
//                case 0: //left button
//                    if let url = URL(string: parkAnnotation.geteventAddress()) {
//                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
//
//                    }
                case 0: //left button
                    //use parent or whatever you call the mapview passed into the coordinator
                    guard let coordinate = parent.locationManager.location?.coordinate
                    //make sure location manager has updated before trying to use
                    else {
                        return
                    };           let url = String(format: "http://maps.apple.com/maps?saddr=%f,%f&daddr=%f,%f", coordinate.latitude,coordinate.longitude,parkAnnotation.getLocation()!.coordinate.latitude,parkAnnotation.getLocation()!.coordinate.longitude)
                    UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
                default:
                    break
            
            }
            
        }
//        @IBAction func mapTypeSegmentSelected(_ sender: UISegmentedControl) {
//                switch sender.selectedSegmentIndex {
//                case 0:
//                    mapView.mapType = .standard
//                case 1:
//                    mapView.mapType = .satellite
//                default:
//                    mapView.mapType = .hybrid
//                }
//            }
        
        //MARK: CLLocationManagerDelegate Methods
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            let local = locations.first!.coordinate
            if !parent.zoomed {
                let region = MKCoordinateRegion.init(center: local, latitudinalMeters: 20000, longitudinalMeters: 20000)
            parent.mapView.setRegion(region, animated: true)
            } else {
                parent.mapView.showAnnotations(parent.events, animated: true)
            }
            parent.stopUpdating()
        }
        
        
        func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            
            switch manager.authorizationStatus {
                case .restricted:
                    parent.showMapAlert.toggle()
                    return
                case .denied:
                    parent.showMapAlert.toggle()
                    return
                case .notDetermined:
                    parent.locationManager
                        .requestWhenInUseAuthorization()
                    parent.showMapAlert = false
                case .authorizedWhenInUse:
                    parent.showMapAlert = false
                    return
                case .authorizedAlways:
                    parent.showMapAlert = false
                    parent.locationManager
                        .allowsBackgroundLocationUpdates = true
                    parent.locationManager
                        .pausesLocationUpdatesAutomatically = false
                    return
                @unknown default:
                    break
            } // end of switch
        }
        
    } // Coordinator
    
} // MapView

struct MapTypeSelect {
    var title: String
    var map: MKMapType
    
//    Picker(selection: $selectedSegment, label: EmptyView,_: ()) {
//        ForEach(0 ..< mapSelect.count) {
//            Text(self.mapSelect[$0].title)
//                    .tag($0)
//
//        }
//
//    }.pickerStyle(SegmentedPickerStyle())
    
//    @State private var selectedSegment = 0
//    @State private var mapSelect = [MapTypeSelect(title: "Standard", map: .standard), MapTypeSelect(title: "Satellite", map: .satellite), MapTypeSelect(title: "Hybrid", map: .hybrid)]
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
    }
}
