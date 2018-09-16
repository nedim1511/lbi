//
//  ViewController.swift
//  Low Battery Indicator
//
//  Created by Nedim on 12/09/2018.
//  Copyright © 2018 Nedim. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let segueName = Segues.fromIntroToAllowNotifications
        print(segueName)
    }
}

