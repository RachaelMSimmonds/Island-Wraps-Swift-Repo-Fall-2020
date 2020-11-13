//
//  LocationManager.swift
//  IslandWrapsApp
//
//  Created by Alex Ketavongsa on 11/12/20.
//

import Foundation
import CoreLocation
import Combine

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()
    let objectWillChange = PassthroughSubject<Void,Never>()
    
    @Published var locationError: Bool? {
        willSet {objectWillChange.send()}
    }
    
    @Published var permissionsError: Bool? {
        willSet {objectWillChange.send()}
    }
    @Published var status: CLAuthorizationStatus? {
        willSet {objectWillChange.send()}
    }
    
    @Published var location: CLLocation? {
        willSet {objectWillChange.send()}
    }
    
    override init() {
        super.init()
        
        /* configure  the CLLocationManager */
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // Request permission
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
        }
        
        locationManager.startUpdatingLocation()

    } // init
    
    @Published var placemark: CLPlacemark? {
        willSet {objectWillChange.send()}
    }
    
    private func geocode() {
        guard let location = location else {return}
        geocoder.reverseGeocodeLocation(location) { (places, error) in
            if error == nil {
                self.placemark = places?[0]
            } else {
                self.placemark = nil
            }
        } // geocoder reverse geocoding
    }
    
} // LocationManager

extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        status = CLLocationManager.authorizationStatus()
        switch status {
            case .restricted:
                self.permissionsError = true
                return
            case .denied:
                self.permissionsError = true
                return
            case .notDetermined:
                self.permissionsError = true
                return
            case .authorizedWhenInUse:
                self.permissionsError = false
                return
            case .authorizedAlways:
                self.permissionsError = false
                return
            case .none:
                self.permissionsError = true
                return
            @unknown default:
                    break
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        
        self.location = location
        self.locationError = false
        self.geocode()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.locationError = true
    }
} // extensions

