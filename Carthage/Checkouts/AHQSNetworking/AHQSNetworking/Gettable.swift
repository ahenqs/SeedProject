//
//  Gettable.swift
//  EasyNetworking
//
//  Created by DA SILVA Andre Henrique on 04/04/2017.
//  Copyright © 2017 a h e n q s. All rights reserved.
//

import Foundation

public protocol Gettable {
    associatedtype T
    func get(completion: @escaping (Result<T>) -> Void)
}
