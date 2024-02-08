//
//  ChallengeViewController.swift
//  Dogs
//
//  Created by Guilherme Delfino on 06/02/24.
//

import Foundation
import UIKit
import DogsApi

class ChallengeViewController: UIViewController {
    
    var dogsView = ChallengeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        view = dogsView
        

    }
    
}
