//
//  ViewController.swift
//  StarWarsApp
//
//  Created by Emil Vaklinov on 02/02/2021.
//

import UIKit
import Lottie
import RxSwift

class PeopleVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    private let disposeBag = DisposeBag()
    
    private let viewModel = PeopleVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        navigationItem.title = "Star Wаrs"
        title = "Star Wars".localized()
        triggerFetchPeople()
    }

    
    private func triggerFetchPeople() {
        ActivityIndicator.shared.show(in: view)
        viewModel.fetchPeople()
            .subscribe(onCompleted: {
                ActivityIndicator.shared.hide()
                self.tableView.reloadData()
            }, onError: { error in
                ActivityIndicator.shared.hide()
                // Show alert
            }).disposed(by: disposeBag)
    }
    
    private func triggerFetchFilms(for index: Int) {
        ActivityIndicator.shared.show(in: view)
        viewModel.fetchFilms(for: index)
            .subscribe(onCompleted: {
                ActivityIndicator.shared.hide()
                self.routeToCharacterDetails(for: index)
            }) { (error) in
                ActivityIndicator.shared.hide()

                // show alert
        }.disposed(by: disposeBag)
    }
    
    private func routeToCharacterDetails(for index: Int) {
        let model = viewModel.dataModel(for: index)
        guard let view = ViewFactory.createDetailView(for: model) else {
            return
        }
        navigationController?.pushViewController(view, animated: true)
    }
}

extension PeopleVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell",
                                                 for: indexPath)
        cell.textLabel?.text = viewModel.people[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.people.count
    }
}

extension PeopleVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        triggerFetchFilms(for: indexPath.row)
    }
}


