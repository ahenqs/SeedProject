//
//  JSONDownloader.swift
//  EasyNetworking
//
//  Created by DA SILVA Andre Henrique on 04/04/2017.
//  Copyright © 2017 a h e n q s. All rights reserved.
//

import Foundation

public typealias JSON = [String: Any]
public typealias JSONTaskCompletionHandler = (Result<JSON>) -> Void

public struct JSONDownloader {
    
    public let session: URLSession
    
    public init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    public init() {
        self.init(configuration: .default)
    }
    
    public func jsonTask(with request: URLRequest, completionHandler: @escaping JSONTaskCompletionHandler) -> URLSessionDataTask {
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completionHandler(.error(.requestFailed))
                return
            }
            
            if httpResponse.statusCode == 200 {
                
                if let data = data {
                    
                    do {
                        
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? JSON {
                        
                            DispatchQueue.main.async {
                                completionHandler(.success(json))
                            }
                            
                        } else {
                            completionHandler(.error(.jsonParsingFailure))
                        }
                        
                    } catch {
                        completionHandler(.error(.jsonConversionFailure))
                    }
                    
                } else {
                    completionHandler(.error(.invalidData))
                }
                
            } else {
                completionHandler(.error(.responseUnsuccessful))
            }
        }
        
        return task
    }
    
}
