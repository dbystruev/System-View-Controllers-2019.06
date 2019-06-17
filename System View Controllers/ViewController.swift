//
//  ViewController.swift
//  System View Controllers
//
//  Created by Denis Bystruev on 17/06/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import MessageUI
import SafariServices
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let url = URL(string: "http://apple.com")!

    @IBAction func shareTapped(_ sender: UIButton) {
        guard let image = imageView.image else { return }
        
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        present(activityController, animated: true)
    }
    
    @IBAction func safariTapped(_ sender: UIButton) {
        let configuration = SFSafariViewController.Configuration()
        configuration.barCollapsingEnabled = false
        let safariViewController = SFSafariViewController(url: url, configuration: configuration)
        
        present(safariViewController, animated: true)
    }
    
    @IBAction func cameraTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { _ in
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true)
            }
            alertController.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { action in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true)
            }
            alertController.addAction(photoLibraryAction)
        }
        
        present(alertController, animated: true)
    }
    
    @IBAction func emailTapped(_ sender: UIButton) {
        guard MFMailComposeViewController.canSendMail() else {
            print(#line, #function, "Can't send mail")
            return
        }
        
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        
        mailComposer.setToRecipients(["dbystruev@me.com"])
        mailComposer.setSubject("Help message [\(Date().timeIntervalSince1970)]")
        mailComposer.setMessageBody("I have issue with your product:", isHTML: false)
        
        present(mailComposer, animated: true)
    }
}
