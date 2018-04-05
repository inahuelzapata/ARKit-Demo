//
//  MainRouter.swift
//  ARKit-Demo
//
//  Created by Nahuel Zapata on 04/04/2018.
//  Copyright © 2018 IntiveFDV. All rights reserved.
//

import Foundation
import UIKit

protocol MainRoutingLogic {

    var viewController: MainViewController? { get set }

    func routeToSimpleARScene()

    func routeToCompositeARScene()

    func routeToPencilARScene()

    func routeToARCoreMLScene()
}

class MainRouter: MainRoutingLogic {

    var navigator: Navigatable?

    weak var viewController: MainViewController?

    init() {
        navigator = Navigator()
    }

    func routeToSimpleARScene() {
        let controllerID = "SimpleViewController"
        guard let controller = viewController?.storyboard?.instantiateViewController(withIdentifier: controllerID)
        as? SimpleViewController else { return }

        navigator?.navigateToNextScene(from: viewController, to: controller)
    }

    func routeToCompositeARScene() {
        let controllerID = "CompositeViewController"
        guard let controller = viewController?.storyboard?.instantiateViewController(withIdentifier: controllerID)
        as? CompositeViewController else { return }

        navigator?.navigateToNextScene(from: viewController, to: controller)
    }

    func routeToPencilARScene() {
        let controllerID = "MagicPencilViewController"
        guard let controller = viewController?.storyboard?.instantiateViewController(withIdentifier: controllerID)
        as? MagicPencilViewController else { return }

        navigator?.navigateToNextScene(from: viewController, to: controller)
    }

    func routeToARCoreMLScene() {
        let controllerID = "CoreMLViewController"
        guard let controller = viewController?.storyboard?.instantiateViewController(withIdentifier: controllerID)
        as? CoreMLViewController else { return }

        navigator?.navigateToNextScene(from: viewController, to: controller)
    }
}
