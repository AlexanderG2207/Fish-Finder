//
//  HomeViewModel.swift
//  mandatory-assignment
//
//  Created by Alexander Görtzen on 02.04.22.
//

import Foundation

class HomeViewModel: ObservableObject {
    //Published variables for VideoPlayer package to be accessable by the HomeView
    @Published var videoUrlString = "https://assets.mixkit.co/videos/preview/mixkit-fish-swimming-on-a-reef-underwater-shot-29736-large.mp4"
    @Published var autoReplay: Bool = true
    @Published var mute: Bool = false
    @Published var play: Bool = true
}
