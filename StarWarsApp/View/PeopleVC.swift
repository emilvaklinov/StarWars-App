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
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell",
                                                     for: indexPath)
            cell.textLabel?.text = viewModel.people[indexPath.row]
            cell.selectionStyle = .none
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell",
                                                     for: indexPath)
            cell.textLabel?.text = viewModel.people[indexPath.row]
            cell.selectionStyle = .none
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell",
                                                     for: indexPath)
            cell.textLabel?.text = viewModel.people[indexPath.row]
            cell.selectionStyle = .none
            
            return cell
        default: return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return viewModel.people.count
        
        switch section {
        
        //             For the user details, return the count of the array
        case 0: return viewModel.people.count
        case 1: return viewModel.people.count
        case 2: return viewModel.people.count
        default: return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "People"
        case 1:
            return "Planet"
        case 2:
            return "Starship"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        view.backgroundColor = .red
        
        let lbl = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 40))
        view.addSubview(lbl)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

extension PeopleVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        triggerFetchFilms(for: indexPath.row)
    }
}


