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
    
    
        var body: some View {
            ZStack {
                Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                    //.ignoresSafeArea()
                    .accentColor(Color(.systemPink))
                    .onAppear{
                        viewModel.checkIfLocationServicesIsEnabled()
                    }
                VStack {
                    HStack{
                        Spacer()
                        Text("26°C")
                            .font(.system(size: 100))
                            .fontWeight(.thin)
                            .foregroundColor(Color.white)
                        Spacer()
                    }.padding(.top, 150)
                    HStack{
                        Spacer()
                        Text("Czarnków, PL")
                            .font(.system(size: 30))
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                    Spacer()
                    
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading).background(LinearGradient(colors: [.blue.opacity(0.3), .blue.opacity(0.9), .blue], startPoint: .top, endPoint: .bottomTrailing))
            }.ignoresSafeArea()
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



