//
//  SongService.swift
//  SeedProject
//
//  Created by DA SILVA Andre Henrique on 05/04/2017.
//  Copyright © 2017 a h e n q s. All rights reserved.
//

import Foundation
import AHQSNetworking
import AHQSView

struct SongService: Gettable {
    
    var endpoint: String {
        return "https://itunes.apple.com/fr/rss/topsongs/limit=25/json"
    }
    
    let downloader = JSONDownloader()
    
    typealias SongCompletionHandler = (Result<[Song?]>) -> ()
    
    func get(completion: @escaping SongCompletionHandler) {
        
        print(self.endpoint)
        
        guard let url = URL(string: self.endpoint) else {
            completion(.error(.invalidURL))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkLoading.shared.start()
        
        let task = downloader.jsonTask(with: request) { (result) in
            
            NetworkLoading.shared.stop()
            
            DispatchQueue.main.async {
                
                switch result {
                case .error(let error):
                    completion(.error(error))
                    return
                    
                case .success(let json):
                    
                    guard let songJSONFeed = json["feed"] as? [String: Any], let entryArray = songJSONFeed["entry"] as? [[String: Any]] else {
                        completion(.error(.jsonParsingFailure))
                        return
                    }
                    
                    let songArray = entryArray.map({ Song(json: $0 as [String : Any]) })
                    completion(.success(songArray))
                }
            }
        }
        
        task.resume()
    }
}
