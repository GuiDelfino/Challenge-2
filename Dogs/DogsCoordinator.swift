//
//  Coordinator.swift
//  Dogs
//
//  Created by Guilherme Delfino on 09/03/24.
//

import Foundation
import UIKit

class DogsCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    
    func start() {
        let viewController = ChallengeViewController()
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
