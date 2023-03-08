//
//  ContentView.swift
//  Geolocation
//
//  Created by Ferran Opticks on 5/3/23.
//

import MapKit
import SwiftUI
import WebKit

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    @EnvironmentObject var locationManager: LocationManager
    @State private var showWebView = false
    private let urlString: String = "https://geolocation.23quirats.com/"
    
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
                Text("altitude: \(locationManager.location?.altitude ?? 0.0)")
                Text("latitude: \(locationManager.location?.coordinate.latitude ?? 0.0)")
                Text("longitude: \(locationManager.location?.coordinate.longitude ?? 0.0)")
                Text("speed km/h: \(speedKmh)")
                Text("speedAccuracy km/h: \(speedAccuracyKmh)")
                Text("speed m/s: \(locationManager.location?.speed ?? 0.0)")
                Text("speedAccuracy m/s: \(locationManager.location?.speedAccuracy ?? 0.0)")
            }.padding()
            VStack {
                WebView(url: URL(string: urlString)!)
            }
        }
    }
}

struct WebView: UIViewRepresentable {
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LocationManager())
    }
}
