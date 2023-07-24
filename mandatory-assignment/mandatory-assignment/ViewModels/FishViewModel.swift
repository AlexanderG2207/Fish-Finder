//
//  FishViewModel.swift
//  mandatory-assignment
//
//  Created by Alexander Görtzen on 05.04.22.
//

import Foundation

class FishViewModel: ObservableObject {
    //This function is the cleanest in my opionion, as it creates an array of the model/struct "TitleAndInfo" which conforms to Identifiable, which I created in the FishModel class. It creates an ID (which I wanted, so that each Fish has the same order of TitleAndInfo in the FishView) and the Title and its corresponding Info. This object is appended to the Array. The Array is returned and can be used to display the Titles and Infos of the specific Fish in the intended order.
    func getFishTitleAndInformation (fish: Fish) -> [TitleAndInfo] {
        var fishTitleAndInfo: [TitleAndInfo] = []
        
        if let population = fish.population {
            fishTitleAndInfo.append(TitleAndInfo(id: 0, title: "Population", info: population))
        }
        fishTitleAndInfo.append(TitleAndInfo(id: 1, title: "Availability", info: fish.availability))
        fishTitleAndInfo.append(TitleAndInfo(id: 2, title: "Harvest Type", info: fish.harvestType))
        if let healthBenefits = fish.healthBenefits {
            fishTitleAndInfo.append(TitleAndInfo(id: 3, title: "Health Benefits", info: healthBenefits))
        }
        fishTitleAndInfo.append(TitleAndInfo(id: 4, title: "Description", info: fish.physicalDescription))
        if let location = fish.location {
            fishTitleAndInfo.append(TitleAndInfo(id: 5, title: "Location", info: location))
        }
        if let habitat = fish.habitat {
            fishTitleAndInfo.append(TitleAndInfo(id: 6, title: "Habitat", info: habitat))
        }
        fishTitleAndInfo.append(TitleAndInfo(id: 7, title: "Biology", info: fish.biology))
        if let color = fish.color {
            fishTitleAndInfo.append(TitleAndInfo(id: 8, title: "Color", info: color))
        }
        
        return fishTitleAndInfo
    }
}
