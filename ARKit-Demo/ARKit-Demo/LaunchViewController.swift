//
//  LaunchViewController.swift
//  ARKit-Demo
//
//  Created by Nahuel Zapata on 04/04/2018.
//  Copyright © 2018 IntiveFDV. All rights reserved.
//

import Foundation
import UIKit

class LaunchViewController: UIViewController {
    @IBOutlet var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = "Augmented Reality"
    }
}
