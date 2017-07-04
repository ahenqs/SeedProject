//
//  NetworkLoading.swift
//  EasyNetworking
//
//  Created by DA SILVA Andre Henrique on 06/04/2017.
//  Copyright © 2017 a h e n q s. All rights reserved.
//

import UIKit

public class NetworkLoading {
    
    public static let shared = NetworkLoading()
    
    private init() {}
    
    public var count: Int = 0
    
    public func start() {
        count += 1
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    public func stop() {
        count -= 1
        
        if count <= 0 {
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
            count = 0
        }
    }
    
}
