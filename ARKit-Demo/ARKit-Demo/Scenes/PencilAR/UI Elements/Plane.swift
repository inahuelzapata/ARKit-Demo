/*
See LICENSE folder for this sample’s licensing information.

Abstract:
SceneKit node wrapper for plane geometry detected in AR.
*/

import ARKit
import Foundation

class Plane: SCNNode {

    var anchor: ARPlaneAnchor
    var focusSquare: FocusSquare?

    init(_ anchor: ARPlaneAnchor) {
        self.anchor = anchor
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(_ anchor: ARPlaneAnchor) {
        self.anchor = anchor
    }
}
