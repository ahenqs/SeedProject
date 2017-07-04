//
//  ViewController.swift
//  Sample
//
//  Created by DA SILVA Andre Henrique on 04/07/2017.
//  Copyright © 2017 a h e n q s. All rights reserved.
//

import UIKit
import AHQSView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(type: .custom)
        button.setTitle("Test button", for: .normal)
        button.backgroundColor = .black
        
        view.addSubview(button)
        
        button.setupConstraints(topAnchor: nil, topConstant: 0.0, leftAnchor: view.leadingAnchor, leftConstant: 16.0, bottomAnchor: view.bottomAnchor, bottomConstant: -16.0, rightAnchor: view.trailingAnchor, rightConstant: -16.0, width: 0.0, height: 50.0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

