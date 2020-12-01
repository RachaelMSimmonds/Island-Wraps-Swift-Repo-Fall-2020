////
////  MyMapTab.swift
////  IslandWrapsApp
////
////  Created by Alex Ketavongsa on 11/12/20.
////

// THIS BREAKS THE CODE DO NOT USE - Rachael Simmonds
//
//import SwiftUI
//import CoreLocation
//
//struct MyMapTab: View {
//    
//    @EnvironmentObject var events: Events
//    @State private var locationManager = CLLocationManager()
//    @State private var showMapAlert = false
//    @State private var selectedSegment = 0
//    @State private var mapSelect = [MapTypeSelect(title: "Standard", map: .standard), MapTypeSelect(title: "Satellite", map: .satellite), MapTypeSelect(title: "Hybrid", map: .hybrid)]
//    @State private var zoomed = false
//    @ObservedObject var lm = LocationManager()
//    
//    var loactionError: Bool {
//        lm.locationError ?? false
//    }
//    
//    var selectedEvent: Event? {
//        events.selectedEvent
//    }
//    
//    @State private var mapView = MapView(events: $events, locationManager: $locationManager, showMapAlert: $showMapAlert, mapType: $mapSelect, zoomed: $zoomed)
//    
//    var alert: Alert {
//            Alert(title: Text("Oops"), message: Text("Error Message"), dismissButton: .default(Text("Dismiss")))
//        }
//    
//    var body: some View {
//        mapView
//            .alert(isPresented: .constant(loactionError)){
//                Alert(title: Text("Location Access Denied"), message: Text("Your location is needed"), primaryButton: .cancel(), secondaryButton: .default(Text("Settings"), action: { goToDeviceSettings()}))
//            }
//            .onAppear {
//                if (selectedEvent != nil) {
//                    mapView
//                        .zoomIn(annotation: selectedEvent!)
//                    events.selectedEvent = nil
//                } else {
//                    mapView.zoomOut()
//                }
//            } // End of onAppear
//    }
//}
//
//extension MyMapTab {
//    // Path to device settings if location is disabled
//    func goToDeviceSettings() {
//        guard let url = URL.init(string: UIApplication.openSettingsURLString) else {
//            return
//        }
//        UIApplication.shared.open(url, options: [:], completionHandler: nil)
//    }
//}
//
//struct MyMapTab_Previews: PreviewProvider {
//    static var previews: some View {
//        MyMapTab()
//    }
//}
