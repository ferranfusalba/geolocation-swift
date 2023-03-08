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
        VStack {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .ignoresSafeArea()
                .accentColor(Color(.systemPink))
                .onAppear {
                    viewModel.checkIfLocationServicesIsEnabled()
                }
            VStack {
                Text("km/h")
                Text("lat: \(locationManager.location?.coordinate.latitude ?? 0.0)")
                Text("lon: \(locationManager.location?.coordinate.longitude ?? 0.0)")
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
