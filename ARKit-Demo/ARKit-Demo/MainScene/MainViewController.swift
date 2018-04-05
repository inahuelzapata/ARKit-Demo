//
//  ViewController.swift
//  ARKit-Demo
//
//  Created by Nahuel Zapata on 04/04/2018.
//  Copyright © 2018 IntiveFDV. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var router: MainRoutingLogic?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        setUpRouter()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setUpRouter()
    }

    func setUpRouter() {
        router = MainRouter()
        router?.viewController = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareNavigationBar()
    }

    func prepareNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    @IBAction func routeToARCoreMLScene(_ sender: Any) {
        router?.routeToARCoreMLScene()
    }

    @IBAction func routeToCompositeARScene(_ sender: Any) {
        router?.routeToCompositeARScene()
    }

    @IBAction func routeToPencilARScene(_ sender: Any) {
        router?.routeToPencilARScene()
    }

    @IBAction func routeToSimpleARScene(_ sender: Any) {
        router?.routeToSimpleARScene()
    }
}
