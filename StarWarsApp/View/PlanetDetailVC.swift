//
//  PlanetDetailVC.swift
//  StarWarsApp
//
//  Created by Emil Vaklinov on 05/02/2021.
//  Copyright © 2021 Emil Vaklinov. All rights reserved.
//

import UIKit

class PlanetDetailVC: UIViewController {

    private var planetDetailVM: PlanetDetailVM?
    
    func configure(with planetDetailVM: PlanetDetailVM) {
        self.planetDetailVM = planetDetailVM
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Planets".localized()
    }
}

extension PlanetDetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterDetail",
                                                 for: indexPath)
        if let type = planetDetailVM?.rowDetails(for: indexPath) {
            cell.textLabel?.text = type.description
            cell.detailTextLabel?.text = type.value
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planetDetailVM?.rowCount(for: section) ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return planetDetailVM?.sectionCount ?? 0
    }
}
