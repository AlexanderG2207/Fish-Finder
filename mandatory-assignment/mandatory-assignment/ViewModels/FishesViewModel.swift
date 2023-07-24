//
//  FishesViewModel.swift
//  mandatory-assignment
//
//  Created by Alexander Görtzen on 02.04.22.
//

import Foundation
import os.log

@MainActor class FishesViewModel: ObservableObject {
    @Published var fetchedFishes: Fishes? //Object to save the Array of Fishes in
    @Published var isFetching = true //Boolean to check if the async function is still fetching or not
    @Published var isFetchingError = false //Boolean to cheack if there was an error in the API call
    let logger = Logger() //Logger to log API issues and successes.
    func fetchData() async {
        let fishesUrlString = "https://www.fishwatch.gov/api/species"
        guard let fishesUrl = URL(string: fishesUrlString) else {
            logger.error("An Invalid Fishes URL was used!")
            return
        }
        do{
            let (data, _) = try await URLSession.shared.data(from: fishesUrl)
            self.fetchedFishes = try JSONDecoder().decode([Fish].self, from: data) //Saves the JSON Response in the fetchedFishes variable
            logger.log("The API returned a valid Response!")
            isFetching = false
        } catch {
            logger.error("Error when fetching Data: \(error.localizedDescription)")
            isFetchingError = true
        }
    }
}
