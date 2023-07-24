//
//  FishesView.swift
//  mandatory-assignment
//
//  Created by Alexander Görtzen on 02.04.22.
//

import SwiftUI

struct FishesView: View {
    @StateObject var fishesViewModel: FishesViewModel
    init () {
        self._fishesViewModel = StateObject(wrappedValue: FishesViewModel())
    }
    var body: some View {
        NavigationView{
            if fishesViewModel.isFetching {
                if !fishesViewModel.isFetchingError {
                    ProgressView("Fetching Fishes...")
                        .scaleEffect(1.5)
                        .font(.caption2)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                } else {
                    VStack{
                        Text("An error occured...").font(.title2).padding()
                        Button ("Try again", action: {
                            fishesViewModel.isFetchingError = false
                            fishesViewModel.isFetching = true
                            Task {
                                await fishesViewModel.fetchData() //Calls the API again if there was a network Error
                            }
                        }).buttonStyle(.bordered).padding().font(.title2)
                    }
                }
            } else {
                if let fishes = fishesViewModel.fetchedFishes {
                    List(fishes) { fish in //Lists each Fish from the Response Fishes Array
                        NavigationLink(destination: FishView(fish: fish)) { //Sends the current fish object to the FishView for it to be able to be displayed in the FishView
                            HStack(alignment: .center) {
                                AsyncImage(url: URL(string: fish.speciesIllustrationPhoto.src)) { image in
                                    image.resizable()
                                        .padding(2)
                                        .shadow(color: .gray, radius: 1, x: 8, y: 8)
                                        .aspectRatio(contentMode: .fit)
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 175, height: 100)
                                .aspectRatio(contentMode: .fit)
                                Spacer()
                                Text(fish.speciesName)
                                    .font(.headline)
                                    .frame(alignment: .center)
                                    .multilineTextAlignment(.center)
                            }
                        }
                    }.navigationBarTitle("Fishes")
                }
            }
        }.navigationViewStyle(.stack)
            .task{
                await fishesViewModel.fetchData() //Calls the API from the function in the FishesViewModel
            }
    }
}

struct ScrollView_Previews: PreviewProvider {
    static var previews: some View {
        FishesView()
    }
}
