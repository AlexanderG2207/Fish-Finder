//
//  FishModel.swift
//  mandatory-assignment
//
//  Created by Alexander Görtzen on 03.04.22.
//

import Foundation

//The Model for the Fish Object
struct Fish: Codable, Identifiable {
    let id = UUID() //Added Id to be able to iterate over the Fishes in the View
    let habitat: String?
    let location: String?
    let population: String?
    let scientificName: String
    let speciesIllustrationPhoto: SpeciesIllustrationPhoto
    let speciesName: String
    let availability: String
    let biology: String
    let color: String?
    let harvestType: String
    let healthBenefits: String?
    let physicalDescription: String
    let quote: String
    
    //ALL OTHER VARIABELS THAT CAN BE RETURNED FROM THE API
    //let fisheryManagement: String?
    //let habitatImpacts: String?
    //let imageGallery: String?
    //let management: String?
    //let noaaFisheriesRegion: String
    //let populationStatus: String?
    //let speciesAliases: String
    //let animalHealth: String?
    //let bycatch: String?
    //let calories: String
    //let carbohydrate: String
    //let cholesterol: String?
    //let diseaseTreatmentAndPrevention: String?
    //let diseasesInSalmon: String?
    //let displayedSeafoodProfileIllustration: String?
    //let ecosystemServices: String?
    //let environmentalConsiderations: String?
    //let environmentalEffects: String?
    //let farmingMethods: String?
    //let otherFarmingMethods: String?
    //let fatTotal: String
    //let otherFeeds: String?
    //let feeds: String?
    //let fiberTotalDietary: String
    //let fishingRate: String?
    //let harvest: String?
    //let otherHumanHealth: String?
    //let humanHealth: String?
    //let production: String?
    //let protein: String
    //let quoteBackgroundColor: String
    //let research: String?
    //let saturatedFattyAcidsTotal: String
    //let selenium: String?
    //let servingWeight: String
    //let servings: String
    //let sodium: String
    //let source: String
    //let sugarsTotal: String
    //let taste: String?
    //let texture: String?
    //let path: String
    //let lastUpdate: String
    
    enum CodingKeys: String, CodingKey {
        case habitat = "Habitat"
        case location = "Location"
        case population = "Population"
        case scientificName = "Scientific Name"
        case speciesIllustrationPhoto = "Species Illustration Photo"
        case speciesName = "Species Name"
        case availability = "Availability"
        case biology = "Biology"
        case color = "Color"
        case harvestType = "Harvest Type"
        case healthBenefits = "Health Benefits"
        case physicalDescription = "Physical Description"
        case quote = "Quote"
    }
}

//The Model for the Species Illustration Photo
struct SpeciesIllustrationPhoto: Codable {
    var src: String
    var alt: String
    var title: String
}

//The Model for the Title and Information of each Fish
struct TitleAndInfo: Identifiable {
    let id: Int
    let title: String
    let info: String
}

typealias Fishes = [Fish] //Model for the API Response Fish Array
