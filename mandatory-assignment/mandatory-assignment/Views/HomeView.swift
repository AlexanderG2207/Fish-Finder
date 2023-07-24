//
//  HomeView.swift
//  mandatory-assignment
//
//  Created by Alexander Görtzen on 01.04.22.
//

import SwiftUI
import VideoPlayer

struct HomeView: View {
    @StateObject var homeViewModel: HomeViewModel = HomeViewModel()
    var body: some View {
        VStack{
            HStack(alignment: .center){
                VStack{
                    Text("FISH").font(Font.custom("OrganicRelief", size: 25)).padding([.leading, .trailing], 5)
                    Text("FINDER").font(Font.custom("OrganicRelief", size: 25)).padding([.leading, .trailing], 5)
                }
                Image("Fish")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .aspectRatio(contentMode: .fit)
            }
            Text("Your go-to to App for Fishes!")
                .font(.title2.bold())
                .padding([.leading, .trailing], 2)
                .frame(alignment: .center)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            Text("Find out about interesting facts on a lot of different types of fishes! Read about facts such as population, availability, harvest type, health benefits, location, habitat, biology and color of any Fish!")
                .font(.headline)
                .frame(alignment: .center)
                .multilineTextAlignment(.center)
                .padding()
            //VideoPlayer package to play a video of fishes swimming in the ocean
            if let videoUrl = URL(string: homeViewModel.videoUrlString) {
            VideoPlayer(url: videoUrl, play: $homeViewModel.play)
                .autoReplay(homeViewModel.autoReplay)
                .mute(homeViewModel.mute)
                .frame(width: 335, height: 200, alignment: .center)
                .border(.black, width: 3)
            }
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
