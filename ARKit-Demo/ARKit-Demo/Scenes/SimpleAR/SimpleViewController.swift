//
//  SimpleViewController.swift
//  ARKit-Demo
//
//  Created by Nahuel Zapata on 04/04/2018.
//  Copyright © 2018 IntiveFDV. All rights reserved.
//

import ARKit
import SceneKit
import UIKit

class SimpleViewController: UIViewController {
    @IBOutlet weak var sceneView: ARSCNView!

    override func viewDidLoad() {
        super.viewDidLoad()

        addPaperPlane()
        configureLighting()
        addTapGestureToSceneView()
    }

    func configureLighting() {
        sceneView.autoenablesDefaultLighting = true
        sceneView.automaticallyUpdatesLighting = true
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

    func addPaperPlane(x: Float = 0, y: Float = 0, z: Float = -0.5) {
        guard let paperPlaneScene = SCNScene(named: "paperPlane.scn"),
            let paperPlaneNode = paperPlaneScene.rootNode.childNode(withName: "paperPlane", recursively: true)
            else { return }
        paperPlaneNode.position = SCNVector3(x, y, z)
        sceneView.scene.rootNode.addChildNode(paperPlaneNode)
    }

    @objc func didTap(_ recognizer: UIGestureRecognizer) {
        let tapLocation = recognizer.location(in: sceneView)
        let hitTestResults = sceneView.hitTest(tapLocation)
        guard let node = hitTestResults.first?.node else {
            let hitTestResultsWithFeaturePoints = sceneView.hitTest(tapLocation, types: .featurePoint)
            if let hitTestResultWithFeaturePoints = hitTestResultsWithFeaturePoints.first {
                let translation = hitTestResultWithFeaturePoints.worldTransform.columns
                addPaperPlane(x: translation.3.x, y: translation.3.y, z: translation.3.z)
            }
            return
        }
        node.removeFromParentNode()
    }

    func addTapGestureToSceneView() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap(_:)))
        sceneView.addGestureRecognizer(tapGestureRecognizer)
    }
}
