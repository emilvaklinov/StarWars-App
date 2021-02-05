//
//  PeopleDetailVC.swift
//  StarWarsApp
//
//  Created by Emil Vaklinov on 05/02/2021.
//  Copyright © 2021 Emil Vaklinov. All rights reserved.
//

import UIKit

class PeopleDetailVC: UIViewController {

    private var viewModel: PeopleDetailVM?
    
    func configure(with viewModel: PeopleDetailVM) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Character: Details".localized()
    }
}

