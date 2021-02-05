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

extension PeopleDetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterDetail",
                                                 for: indexPath)
        if let type = viewModel?.rowDetails(for: indexPath) {
            cell.textLabel?.text = type.description
            cell.detailTextLabel?.text = type.value
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.rowCount(for: section) ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.sectionCount ?? 0
    }
}
