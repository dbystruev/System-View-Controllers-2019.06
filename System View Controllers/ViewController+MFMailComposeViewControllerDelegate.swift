//
//  ViewController+MFMailComposeViewControllerDelegate.swift
//  System View Controllers
//
//  Created by Denis Bystruev on 17/06/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import MessageUI

// MARK: - MFMailComposeViewControllerDelegate
extension ViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true)
    }
}
