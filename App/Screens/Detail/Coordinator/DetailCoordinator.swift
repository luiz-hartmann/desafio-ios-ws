//
//  DetailCoordinator.swift
//  App
//
//  Created by Luiz Hartmann on 18/11/22.
//

import UIKit

class DetailCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinator: [Coordinator] = []
    var viewModel: DetailViewModel?
    
    init(navigationController: UINavigationController, viewModel: DetailViewModel) {
        self.navigationController = navigationController
        self.viewModel = viewModel
    }
    
    func start() {
        let view = DetailViewController()
        view.viewModel = viewModel

        self.navigationController.pushViewController(view, animated: true)
    }
}

