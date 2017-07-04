//
//  SongViewModel.swift
//  SeedProject
//
//  Created by DA SILVA Andre Henrique on 05/04/2017.
//  Copyright © 2017 a h e n q s. All rights reserved.
//

import Foundation
import AHQSNetworking
import AHQSView

struct SongViewModel {
    
    let title: String
    let imageURL: String
    let releaseDate: String
    let purchasePrice: String
    let summary: String
    let artist: String
    
    init(model: Song) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        self.title = model.title
        self.imageURL = model.imageURL
        
        if let releaseDate = model.releaseDate {
            self.releaseDate = "Release: \(dateFormatter.string(from: releaseDate))"
        } else {
            self.releaseDate = ""
        }
        
        self.purchasePrice = String(format: "%.2f", model.purchasePrice)
        self.summary = model.summary
        self.artist = model.artist
    }
    
}
