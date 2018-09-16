//
//  AllowNotificationsViewController.swift
//  Low Battery Indicator
//
//  Created by Nedim on 16/09/2018.
//  Copyright © 2018 Nedim. All rights reserved.
//

import UIKit
import UserNotifications

class AllowNotificationsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var allowNotificationsUILabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var sureAllowUIButton: RoundedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadFont()
        showElements()
    }
    
    func showElements() {
        UIView.animate(withDuration: FADE_DURATION) {
            self.allowNotificationsUILabel.alpha = 1
            self.descriptionLabel.alpha = 1
            self.sureAllowUIButton.alpha = 1
        }
    }
    
    func loadFont() {
        allowNotificationsUILabel.font = UIFont.SFProDisplayUltraLight(withSizeOf: allowNotificationsUILabel)
        descriptionLabel.font = UIFont.SFProDisplayUltraLight(withSizeOf: descriptionLabel)
        guard let buttonLabel = sureAllowUIButton.titleLabel else { return }
        buttonLabel.font = UIFont.SFProDisplayUltraLight(withSizeOf: buttonLabel)
    }
    
    @IBAction func sureAllowUIButtonTapped(_ sender: Any) {
        let center = UNUserNotificationCenter.current()
        let options: UNAuthorizationOptions = [.alert, .sound, .carPlay]
        center.requestAuthorization(options: options) { (granted, error) in
            if error != nil {
                // alert that an error has occured
            } else if !granted {
                // alert that the user cannot properly use the application unless settings change
                // add an option to proceed anyways
            } else {
                // perform segue
                // update userdefaults
            }
        }
    }
}
