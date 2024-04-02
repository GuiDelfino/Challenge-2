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
    var nav = UINavigationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        view = dogsView
        
        let service = HttpDogsService()
                service.getBreeds { result in
                    switch result {
                    case .success(let breeds):
                        self.dogsView.dogsGuard = breeds
                    case .failure(let error):
                        break
                    }
                }

    /*   service.getImageURLs(breed: BreedImages) { result in
            switch result {
                case .success(let breedImage):
                    self.dogsView.dogsImageGuard = breedImage
            case .failure(let errorImage):
                    break
            }
        } */

        
        

    }
    
}




