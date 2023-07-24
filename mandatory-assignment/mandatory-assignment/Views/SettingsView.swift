//
//  SettingsView.swift
//  mandatory-assignment
//
//  Created by Alexander Görtzen on 02.04.22.
//

import SwiftUI
import ConfettiSwiftUI

struct FishingView: View {
    @State var counter:Int = 0 //Counter for the ConfettiSwiftUI package
    var body: some View {
        VStack{
            ZStack {
                //Sprays Confetti when the counter is increased, which increases when the emoji is clicked
                Text("🎣").font(.system(size: 100)).onTapGesture(){counter += 1}
                ConfettiCannon(counter: $counter, num: 12, confettis: [.text("🐟")], confettiSize: 35)
            }
            Text("Click to go fishing!").font(.title2.bold()).padding()
        }
    }
}

struct AboutView: View {
    var body: some View {
        VStack{
            Text("Created by Alexander Görtzen for the IPraktikum Mandatory Assignment in the Summer Semester 2022")
                .padding()
                .multilineTextAlignment(.center)
                .font(.title2)
            Spacer()
            Image("Pleadfish")
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
                .aspectRatio(contentMode: .fit)
            Text("❤️ to fishwatch.gov")
                .padding()
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .font(.body)
        }
    }
}

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("APPEARANCE")) {
                    VStack {
                        //The toggle changes the boolean to true, which changes all Views to Dark mode as defined in ContentView
                        Toggle("Dark Mode", isOn: $isDarkMode)
                        Text("Light text on a dark background").font(.caption).frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                Section(header: Text("FISHING")) {
                    NavigationLink(destination: FishingView()) {
                        Text("Go Fishing")
                    }
                }
                Section(header: Text("HELP")) {
                    HStack{
                        Text("Version")
                        Spacer()
                        Text("1.0.0").font(.headline.bold())
                    }
                    NavigationLink(destination: AboutView()) {
                        Text("About")
                    }
                }
            }.navigationBarTitle("Settings")
        }.navigationViewStyle(.stack)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
