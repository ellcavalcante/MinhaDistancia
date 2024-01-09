//
//  StartedViewController.swift
//  DevPoliChallenge
//
//  Created by Ellington Cavalcante on 09/01/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import UIKit

class StartedViewController: UIViewController {
    
    var screen: StartedScreen?
    
    override func loadView() {
        screen = StartedScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate = self
    }
}

extension StartedViewController: StartedScreenProtocol {
    func actionEnableButton() {
        print(#function)
    }
}
