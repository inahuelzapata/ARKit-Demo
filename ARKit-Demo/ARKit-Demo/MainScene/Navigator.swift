//
//  Navigator.swift
//  ARKit-Demo
//
//  Created by Nahuel Zapata on 04/04/2018.
//  Copyright © 2018 IntiveFDV. All rights reserved.
//

import Foundation
import UIKit

protocol Navigatable {
    func navigateToNextScene<T>(from source: T?, to destination: T) where T: UIViewController
}

class Navigator: Navigatable {
    func navigateToNextScene<T>(from source: T?, to destination: T) where T: UIViewController {
        source?.navigationController?.pushViewController(destination, animated: true)
    }
}
