//
//  Song.swift
//  SeedProject
//
//  Created by DA SILVA Andre Henrique on 05/04/2017.
//  Copyright © 2017 a h e n q s. All rights reserved.
//

import Foundation
import AHQSNetworking
import AHQSView

struct Song {
    
    var title: String = ""
    var imageURL: String = ""
    var releaseDate: Date? = nil
    var purchasePrice: Double = 0.0
    var summary: String = ""
    var artist: String = ""
}

extension Song {
    struct Key  {
        static let titleDict = "im:name"
        static let imageURLArray = "im:image"
        static let releaseDateDict = "im:releaseDate"
        static let categoryDict = "category"
        static let rentalPriceDict = "im:rentalPrice"
        static let purchacePriceDict = "im:price"
        static let itunesLinkArray = "link"
        static let summaryDict = "summary"
        static let label = "label"
        static let attributes = "attributes"
        static let amount = "amount"
        static let currency = "currency"
        static let href = "href"
        static let term = "term"
        static let artist = "im:artist"
    }
    
    //failable initializer
    
    init?(json: [String: Any]) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        guard let titleDict = json[Key.titleDict] as? [String: Any],
            let title = titleDict[Key.label] as? String,
            let imageURLArray = json[Key.imageURLArray] as? [[String: Any]],
            let imageURL = imageURLArray.last?[Key.label] as? String,
            let releaseDateDict = json[Key.releaseDateDict] as? [String: Any],
            let releaseDateString = releaseDateDict[Key.label] as? String,
            let releaseDate = dateFormatter.date(from: releaseDateString),
            let purchasePriceDict = json[Key.purchacePriceDict] as? [String: Any],
            let purchasePriceAttributes = purchasePriceDict[Key.attributes] as? [String: Any],
            let priceString = purchasePriceAttributes[Key.amount] as? String,
            let priceAmount = Double(priceString),
            let artistDict = json[Key.artist] as? [String: Any],
            let artistString = artistDict[Key.label] as? String
            else {
                return nil
        }
        
        self.title = title
        self.imageURL = imageURL
        self.releaseDate = releaseDate
        self.purchasePrice = priceAmount
        self.artist = artistString
        if let summaryDict = json[Key.summaryDict] as? [String: Any], let summary = summaryDict[Key.label] as? String {
            self.summary = summary
        } else {
            self.summary = ""
        }
    }
}
