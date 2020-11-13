//
//  MyMapTab.swift
//  IslandWrapsApp
//
//  Created by Alex Ketavongsa on 11/12/20.
//

import SwiftUI
import CoreLocation

struct MyMapTab: View {
    
    @EnvironmentObject var events: Events
    
    @ObservedObject var lm = LocationManager()
    
    var loactionError: Bool {
        lm.locationError ?? false
    }
    
    var selectedEvent: Event? {
        events.selectedEvent
    }
    
    @State private var mapView = MapView()
    
    var body: some View {
        mapView
            .alert(isPresented: .constant(loactionError)){
                Alert(title: Text("Location Access Denied"), message: Text("Your location is needed"), primaryButton: .cancel(), secondaryButton: .default(Text("Settings"), action: { goToDeviceSettings()}))
            }
            .onAppear {
                if (selectedEvent != nil) {
                    mapView
                        .zoomIn(annotation: selectedEvent!)
                    events.selectedEvent = nil
                } else {
                    mapView.zoomOut()
                }
            } // End of onAppear
    }
}

extension MyMapTab {
    // Path to device settings if location is disabled
    func goToDeviceSettings() {
        guard let url = URL.init(string: UIApplication.openSettingsURLString) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

struct MyMapTab_Previews: PreviewProvider {
    static var previews: some View {
        MyMapTab()
    }
}
