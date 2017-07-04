//
//  SongsViewController.swift
//  SeedProject
//
//  Created by DA SILVA Andre Henrique on 05/04/2017.
//  Copyright © 2017 a h e n q s. All rights reserved.
//

import UIKit
import AHQSNetworking
import AHQSView

class SongsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let tableManager = SongDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDelegates()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getSongs(fromService: SongService())
    }
    
    func setupDelegates() {
        
        tableView.dataSource = tableManager
        tableView.delegate = tableManager
    }
    
    func setupUI() {
        
        title = "Songs"
        
        tableView.backgroundColor = .black
        tableView.separatorColor = .black
        tableView.separatorInset = .zero
    }
    
    private func getSongs<Service: Gettable>(fromService service: Service) where Service.T == [Song?] {
        
        clearTableView()
        
        service.get { [weak self] (result) in
            
            switch result {
            case .success(let movies):
                
                var tempSongs = [Song]()
                
                tempSongs = movies.flatMap({ $0 })
                
                self?.tableManager.items = tempSongs
                
                self?.tableView.reloadData()
                
                break
            case .error(let error):
                
                print(error.localizedDescription)
                
                var message = ""
                
                switch error {
                    
                case .invalidData:
                    message = "Invalid data."
                    
                    break
                case .invalidURL:
                    message = "Invalid URL."
                    
                    break
                case .jsonConversionFailure:
                    message = "JSON conversion failure."
                    
                    break
                case .jsonParsingFailure:
                    message = "No data found for this country."
                    
                    break
                case .requestFailed:
                    message = "Request failed."
                    
                    break
                case .responseUnsuccessful:
                    message = "Response unsuccessful."
                    
                    break
                }
                
                let alertController = UIAlertController(title: "Oops...", message: message, preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                
                alertController.addAction(okAction)
                
                self?.present(alertController, animated: true, completion: nil)
                
                break
            }
            
        }
    }
    
    private func clearTableView() {
        
        self.tableManager.items = [Song]()
        self.tableView.reloadData()
    }
}
