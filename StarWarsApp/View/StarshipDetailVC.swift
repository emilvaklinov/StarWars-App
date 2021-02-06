//
//  StarshipDetailVC.swift
//  StarWarsApp
//
//  Created by Emil Vaklinov on 05/02/2021.
//  Copyright © 2021 Emil Vaklinov. All rights reserved.
//

import UIKit

class StarshipDetailVC: UIViewController {

    private var starshipDetailVM: StarshipDetailVM?
    
    func configure(with starshipDetailVM: StarshipDetailVM) {
        self.starshipDetailVM = starshipDetailVM
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Starships".localized()
    }
}

extension StarshipDetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "starshipDetail",
                                                 for: indexPath)
        if let type = starshipDetailVM?.rowDetails(for: indexPath) {
            cell.textLabel?.text = type.description
            cell.detailTextLabel?.text = type.value
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starshipDetailVM?.rowCount(for: section) ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return starshipDetailVM?.sectionCount ?? 0
    }
}
