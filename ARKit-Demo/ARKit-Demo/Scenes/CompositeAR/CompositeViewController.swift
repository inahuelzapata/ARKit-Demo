//
//  CompositeViewController.swift
//  ARKit-Demo
//
//  Created by Nahuel Zapata on 04/04/2018.
//  Copyright © 2018 IntiveFDV. All rights reserved.
//

import ARKit
import SceneKit
import UIKit

class CompositeViewController: UIViewController {
    @IBOutlet weak var sceneView: ARSCNView!

    override func viewDidLoad() {
        super.viewDidLoad()

        sceneView.delegate = self
        addCar(x: 0, y: -0.5)
        configureLighting()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }

    func configureLighting() {
        sceneView.autoenablesDefaultLighting = true
        sceneView.automaticallyUpdatesLighting = true
    }

    func addCar(x: Float = 0, y: Float = 0, z: Float = -0.5) {
        guard let carScene = SCNScene(named: "car.dae") else {
            return
        }
        let carNode = SCNNode()
        let carSceneChildNodes = carScene.rootNode.childNodes

        for childNode in carSceneChildNodes {
            carNode.addChildNode(childNode)
        }

        carNode.position = SCNVector3(x, y, z)
        carNode.scale = SCNVector3(0.5, 0.5, 0.5)
        sceneView.scene.rootNode.addChildNode(carNode)
    }
}

extension CompositeViewController: ARSCNViewDelegate {

}
