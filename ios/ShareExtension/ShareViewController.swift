//
//  ShareViewController.swift
//  ShareExtension
//
//  Created by Jackie Jensen on 03/06/2026.
//

import UIKit
import Social
import receive_sharing_intent

class ShareViewController: RSIShareViewController {
    
    // We want the app to auto-redirect immediately when a share is received
    override func shouldAutoRedirect() -> Bool {
        return true
    }
}
