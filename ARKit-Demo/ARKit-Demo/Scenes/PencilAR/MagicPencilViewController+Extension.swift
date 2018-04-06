//
//  MagicPencilViewController+Extension.swift
//  ARKit-Demo
//
//  Created by Nahuel Zapata on 05/04/2018.
//  Copyright © 2018 IntiveFDV. All rights reserved.
//

import SceneKit
import UIKit

extension MagicPencilViewController {

    enum SegueIdentifier: String {
        case showSettings
    }

    // MARK: - Interface Actions

    @IBAction func restartExperience(_ sender: Any) {

        guard restartExperienceButtonIsEnabled else { return }

        DispatchQueue.main.async {
            self.restartExperienceButtonIsEnabled = false

            self.textManager.cancelAllScheduledMessages()
            self.textManager.dismissPresentedAlert()
            self.textManager.showMessage("STARTING A NEW SESSION")

            self.virtualObjectManager.removeAllVirtualObjects()
            self.focusSquare?.isHidden = true

            self.resetTracking()

            self.restartExperienceButton.setImage(#imageLiteral(resourceName: "restart"), for: [])

            // Show the focus square after a short delay to ensure all plane anchors have been deleted.
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.setupFocusSquare()
            })

            // Disable Restart button for a while in order to give the session enough time to restart.
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
                self.restartExperienceButtonIsEnabled = true
            })
        }
    }
}
