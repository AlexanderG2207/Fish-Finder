//
//  FishView.swift
//  mandatory-assignment
//
//  Created by Alexander Görtzen on 04.04.22.
//

import SwiftUI

struct FishView: View {
    @StateObject var fishViewModel: FishViewModel
    var fish: Fish //Fish Object that is passed from the FishesView
    init (fish: Fish) {
        self._fishViewModel = StateObject(wrappedValue: FishViewModel())
        self.fish = fish
    }
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Text(fish.speciesName.uppercased())
                    .frame(alignment: .center)
                    .font(Font.custom("OrganicRelief", size: 20))
                    .multilineTextAlignment(.center)
                Text(fish.scientificName)
                    .font(.title)
                    .frame(alignment: .center)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(3)
                AsyncImage(url: URL(string: fish.speciesIllustrationPhoto.src)) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.top, .bottom], 20)
                        .padding([.trailing, .leading, .bottom], 5)
                        .shadow(color: .gray, radius: 3, x: 20, y: 20)
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(contentMode: .fit)
                Spacer()
                Text(fish.quote).font(.headline.bold()).padding([.leading, .bottom, .trailing], 10).frame(alignment: .center).multilineTextAlignment(.center)
                // I tried around with the Dictionary and tried by using a dictionary of [title: String, info: String]. However, for it to be able to be used in a ForEach, it has to conform to Identifiable and by adding an id key path "id: .\self", it identifies the key pairs but still gives them out in a different order for each different Fish, which is not ideal.
                // By using .replacingOccurences was the only way I thought of removing things like "<li>" from the different Strings that the API returned.
                ForEach(fishViewModel.getFishTitleAndInformation(fish: fish)) { titleInfo in
                    Text(titleInfo.title)
                        .font(.title3.bold())
                        .padding([.leading, .top, .trailing], 10)
                        .frame(alignment: .center)
                        .multilineTextAlignment(.center)
                    Text(String(titleInfo.info).replacingOccurrences(of: "\\s?\\<[^>]*\\>", with: " ", options: .regularExpression))
                        .font(.body)
                        .padding([.leading, .trailing], 10)
                        .frame(alignment: .center)
                        .multilineTextAlignment(.center)
                }
            }
        }
    }
}

struct FishView_Previews: PreviewProvider {
    static var previews: some View {
        FishView(
            fish: Fish (
                habitat: "In a Rock",
                location: "Under the Sea",
                population: "A lot",
                scientificName: "Biggus Fishus",
                speciesIllustrationPhoto: SpeciesIllustrationPhoto (src: "https://www.fishwatch.gov/sites/default/files/Hake_White_NB_W_0.png", alt: "nice", title: "Big Fish"),
                speciesName: "Monster Fish",
                availability: "All the Time",
                biology: "Complex",
                color: "Pink",
                harvestType: "Wild",
                healthBenefits: "Very Good",
                physicalDescription: "Funny Fish",
                quote: "best Fish"
            ))
    }
}
