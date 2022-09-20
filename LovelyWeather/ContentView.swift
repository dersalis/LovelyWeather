//
//  ContentView.swift
//  LovelyWeather
//
//  Created by Damian Ruta on 20/09/2022.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 52.90360611831819, longitude: 16.566844805651744), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
        var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true)
                .ignoresSafeArea()
                .onAppear{
                    viewModel.checkIfLocationServicesIsEnabled()
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            //checkLocationAuthorization()
        } else {
            print("Turn on location!")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else {
            return
        }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted likely due to parental controls.")
        case .denied:
            print("You have danied this app location permmission. Go into settings to change it")
        case .authorizedAlways, .authorizedWhenInUse:
            break
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
