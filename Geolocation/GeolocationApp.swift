//
//  GeolocationApp.swift
//  Geolocation
//
//  Created by Ferran Opticks on 5/3/23.
//

import SwiftUI

@main
struct GeolocationApp: App {
    @StateObject var locationManager = LocationManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationManager)
        }
    }
}
