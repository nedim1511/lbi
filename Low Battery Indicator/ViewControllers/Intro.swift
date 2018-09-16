//
//  ViewController.swift
//  Low Battery Indicator
//
//  Created by Nedim on 12/09/2018.
//  Copyright © 2018 Nedim. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var logoUIImage: UIImageView!
    @IBOutlet weak var appTitleUILabel: UILabel!
    @IBOutlet weak var appDescriptionLabel: UILabel!
    @IBOutlet weak var continueButton: RoundedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadFont()
        fadeElementsTo(alpha: 1)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        fadeElementsTo(alpha: 0)
    }
    
    // MARK: - User Interface
    func loadFont() {
        appTitleUILabel.font = UIFont.SFProDisplayUltraLight(withSizeOf: appTitleUILabel)
        appDescriptionLabel.font = UIFont.SFProDisplayUltraLight(withSizeOf: appDescriptionLabel)
        guard let buttonLabel = continueButton.titleLabel else { return }
        buttonLabel.font = UIFont.SFProDisplayUltraLight(withSizeOf: buttonLabel)
    }
    
    // Fade UI Elements
    func fadeElementsTo(alpha: CGFloat) {
        UIView.animate(withDuration: FADE_DURATION, animations: {
            self.logoUIImage.alpha = alpha
        }) { (_) in
            UIView.animate(withDuration: FADE_DURATION, animations: {
                self.appTitleUILabel.alpha = alpha
            }, completion: { (_) in
                UIView.animate(withDuration: FADE_DURATION, animations: {
                    self.appDescriptionLabel.alpha = alpha
                }, completion: { (_) in
                    UIView.animate(withDuration: FADE_DURATION, animations: {
                        self.continueButton.alpha = alpha
                    })
                })
            })
        }
    }
    
    // MARK: Continue Button Tapped
    @IBAction func continueButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: Segues.fromIntroToAllowNotifications, sender: nil)
    }
}

