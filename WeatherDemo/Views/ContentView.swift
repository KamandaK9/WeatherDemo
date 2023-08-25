//
//  ContentView.swift
//  WeatherDemo
//
//  Created by Daniel Senga on 2022/11/17.
//

import SwiftUI

struct ContentView: View {
	@StateObject var locationManager = LocationManager()
	var weatherManager = WeatherManager()
	@State var weather: ResponseBody?
	
	var body: some View {
		VStack {
			if let location = locationManager.location {
				if let weather = weather {
					WeatherView(weather: weather)
				} else {
					ProgressView()
						.task {
							do {
								weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
							} catch {
								print("Error getting weather: \(error)")
							}
						}
				}
			} else {
				if locationManager.isLoading {
					ProgressView()
				} else {
					WelcomeView()
						.environmentObject(locationManager)
				}
			}
		}
		.background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
		.preferredColorScheme(.dark)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
