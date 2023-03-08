//
//  ContentView.swift
//  Geolocation
//
//  Created by Ferran Opticks on 5/3/23.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        let speedKmh = ((locationManager.location?.speed ?? 0.0) * 3600) / 1000
        let speedAccuracyKmh = ((locationManager.location?.speedAccuracy ?? 0.0) * 3600) / 1000
        
        VStack {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .ignoresSafeArea()
                .accentColor(Color(.systemPink))
                .onAppear {
                    viewModel.checkIfLocationServicesIsEnabled()
                }
            VStack {
                Text("speed m/s: \(locationManager.location?.speed ?? 0.0)")
                Text("speedAccuracy m/s: \(locationManager.location?.speedAccuracy ?? 0.0)")
                Text("speed km/h: \(speedKmh)")
                Text("speedAccuracy km/h: \(speedAccuracyKmh)")
                Text("latitude: \(locationManager.location?.coordinate.latitude ?? 0.0)")
                Text("longitude: \(locationManager.location?.coordinate.longitude ?? 0.0)")
                Text("altitude: \(locationManager.location?.altitude ?? 0.0)")
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LocationManager())
    }
}
