//
//  SongDataManager.swift
//  SeedProject
//
//  Created by DA SILVA Andre Henrique on 05/04/2017.
//  Copyright © 2017 a h e n q s. All rights reserved.
//

import UIKit
import AHQSNetworking
import AHQSView

class SongDataManager: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var items: [Song] = [Song]()
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as! SongCell
        
        let song = items[indexPath.row]
        
        let viewModel = SongViewModel(model: song)
        
        cell.displaySongInCell(using: viewModel)
        
        return cell
    }
}
