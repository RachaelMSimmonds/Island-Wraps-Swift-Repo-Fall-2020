//
//  MapView.swift
//  IslandWrapsApp
//
//  Created by Alex Ketavongsa on 11/12/20.
//

import Foundation
import SwiftUI
import MapKit
import CoreLocation

// conform protocol
struct MapView: UIViewRepresentable {
    
    @EnvironmentObject var events: Events
    
    let mapView = MKMapView()
    
    func makeUIView(context: Context) -> MKMapView {
        
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager.requestWhenInUseAuthorization()
//        }
//        locationManager.delegate = context.coordinator
        mapView.delegate = context.coordinator
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.showsUserLocation = true
//        let np = NorthPole()
//        uiView.addAnnotation(np)
        mapView.addAnnotations(events.list)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func zoomIn(annotation: MKAnnotation) {
        let region = MKCoordinateRegion.init(center: annotation.coordinate, latitudinalMeters: 20000, longitudinalMeters: 20000)
        mapView.setRegion(region, animated: true)
    }
    
    func zoomOut() {
        mapView.showAnnotations(mapView.annotations, animated: true)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate //CLLocationManagerDelegate
    {
        
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        //MARK: - MapViewDelegate Protocol Methods
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            print(mapView.centerCoordinate)
        }
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            mapView.addAnnotations(parent.events.list)
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            let annotation = view.annotation
            print("The title of the annotation is: \(annotation?.title)")
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
                    let rightButton = UIButton(type: .detailDisclosure)
                    
                    leftButton.tag = 0
                    rightButton.tag = 1
                    
                    view.leftCalloutAccessoryView = leftButton
                    view.rightCalloutAccessoryView = rightButton
                }
                return view
            }
            return nil
        }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            
            print("Control tapped: \(control), tag: \(control.tag)")
        }
        
        //MARK: CLLocationManagerDelegate Methods
//        func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//
//            switch manager.authorizationStatus {
//                case .restricted:
//                    parent.showMapAlert.toggle()
//                    return
//                case .denied:
//                    parent.showMapAlert.toggle()
//                    return
//                case .notDetermined:
//                    parent.locationManager
//                        .requestWhenInUseAuthorization()
//                    parent.showMapAlert = false
//                case .authorizedWhenInUse:
//                    parent.showMapAlert = false
//                    return
//                case .authorizedAlways:
//                    parent.showMapAlert = false
//                    parent.locationManager
//                        .allowsBackgroundLocationUpdates = true
//                    parent.locationManager
//                        .pausesLocationUpdatesAutomatically = false
//                    return
//                @unknown default:
//                    break
//            } // end of switch
//        }
//
    } // Coordinator
    
} // MapView

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
