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
                Text("lat: ")
                Text("lon: ")
                Text("altitude")
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
