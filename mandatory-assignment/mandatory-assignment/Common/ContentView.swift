//
//  ContentView.swift
//  mandatory-assignment
//
//  Created by Alexander Görtzen on 02.04.22.
//

import SwiftUI

struct ContentView: View {
    //@AppStorage is used to save the preference of the appearance mode for the user so that it available throughout the app even when the user closes the app and opens it again.
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            FishesView()
                .tabItem {
                    Image(systemName: "diamond")
                    Text("Fishes")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "slider.horizontal.3")
                    Text("Settings")
                }
        }.environment(\.colorScheme, isDarkMode ? .dark : .light) //Sets the colorScheme of the environment to dark mode or light mode so all views are either dark or light mode
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
