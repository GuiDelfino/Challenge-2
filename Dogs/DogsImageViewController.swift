//
//  DogsImageViewController.swift
//  Dogs
//
//  Created by Guilherme Delfino on 09/03/24.
//

import Foundation
import UIKit
import DogsApi

class DogsImageViewController: UIViewController {
    
    var dogsView = DogsImageView()
    
    override func viewDidLoad() {
        view = dogsView
    }
    
    
    
}
