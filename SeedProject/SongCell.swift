//
//  SongCell.swift
//  SeedProject
//
//  Created by DA SILVA Andre Henrique on 05/04/2017.
//  Copyright © 2017 a h e n q s. All rights reserved.
//

import UIKit
import AHQSNetworking
import AHQSView

class SongCell: UITableViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.photoImageView.contentMode = .scaleAspectFit
        
        contentView.backgroundColor = .black
        
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        
        releaseDateLabel.textColor = .white
        releaseDateLabel.font = UIFont.systemFont(ofSize: 12.0)
        
        priceLabel.textColor = .white
        priceLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        
        artistLabel.textColor = .white
        artistLabel.font = UIFont.systemFont(ofSize: 14.0)
    }
    
    func displaySongInCell(using viewModel: SongViewModel) {
        
        self.titleLabel.text = viewModel.title
        self.releaseDateLabel.text = viewModel.releaseDate
        self.priceLabel.text = viewModel.purchasePrice
        self.artistLabel.text = viewModel.artist
        
        self.photoImageView.loadImageUsingCacheWithURLString(viewModel.imageURL, placeHolder: nil) { (success) in
            
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        if selected {
            
            contentView.backgroundColor = .lightGray
            
        } else {
            
            contentView.backgroundColor = .black
        }
        
    }
    
}
