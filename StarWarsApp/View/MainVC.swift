//
//  ViewController.swift
//  StarWarsApp
//
//  Created by Emil Vaklinov on 02/02/2021.
//

import UIKit
import Lottie
import RxSwift

class MainVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    private let disposeBag = DisposeBag()
    
    private let viewModel = PeopleVM()
    private let planetVM = PlanetVM()
    private let starshipVM = StarshipVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Star Wars".localized()
        triggerFetchPeople()
        triggerFetchPlanet()
        triggerFetchStarship()
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
    
    private func triggerFetchPlanet() {
        ActivityIndicator.shared.show(in: view)
        planetVM.fetchPlanet()
            .subscribe(onCompleted: {
                ActivityIndicator.shared.hide()
                self.tableView.reloadData()
            }, onError: { error in
                ActivityIndicator.shared.hide()
                // Show alert
            }).disposed(by: disposeBag)
    }
    
    private func triggerFetchStarship() {
        ActivityIndicator.shared.show(in: view)
        starshipVM.fetchStarship()
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
    
    private func triggerFetchFilmsPlanets(for index: Int) {
        ActivityIndicator.shared.show(in: view)
        planetVM.fetchFilms(for: index)
            .subscribe(onCompleted: {
                ActivityIndicator.shared.hide()
                self.routeToCharacterDetails(for: index)
            }) { (error) in
                ActivityIndicator.shared.hide()
                
                // show alert
            }.disposed(by: disposeBag)
    }
    
    private func triggerFetchFilmsStarship(for index: Int) {
        ActivityIndicator.shared.show(in: view)
        starshipVM.fetchFilms(for: index)
            .subscribe(onCompleted: {
                ActivityIndicator.shared.hide()
                self.routeToCharacterDetails(for: index)
            }) { (error) in
                ActivityIndicator.shared.hide()
                
                // show alert
            }.disposed(by: disposeBag)
    }

    fileprivate func routeToCharacterDetails(for index: Int) {
        let model = viewModel.dataModel(for: index)
        guard let view = PeopleViewFactory.createDetailView(for: model) else {
            return
        }
        navigationController?.pushViewController(view, animated: true)
    }
    
    fileprivate func routeToPlanetDetails(for index: Int) {
        let modelPlanet = planetVM.dataModel(for: index)
        guard let view = PlanetViewFactory.createDetailPlanetView(for: modelPlanet) else {
            return
        }
        navigationController?.pushViewController(view, animated: true)
    }
    
    fileprivate func routeToStarshipDetails(for index: Int) {
        let modelStarship = starshipVM.dataModel(for: index)
        guard let view = StarshipViewFactory.createDetailStarshipView(for: modelStarship) else {
            return
        }
        navigationController?.pushViewController(view, animated: true)
    }
}

extension MainVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        
        //  For the user details, return the count of the array
        case 0: return viewModel.people.count
        case 1: return planetVM.planet.count
        case 2: return starshipVM.starship.count
        default: return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell",
                                                     for: indexPath)
            cell.textLabel?.text = viewModel.people[indexPath.row]
            cell.selectionStyle = .none
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "planetCell",
                                                     for: indexPath)
            cell.textLabel?.text = planetVM.planet[indexPath.row]
            cell.selectionStyle = .none
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "starshipCell",
                                                     for: indexPath)
            cell.textLabel?.text = starshipVM.starship[indexPath.row]
            cell.selectionStyle = .none
            
            return cell
        default: return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "People"
        case 1:
            return "Planets"
        case 2:
            return "Starships"
        default:
            return nil
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
    }
}

extension MainVC: UITableViewDelegate {
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            return triggerFetchFilms(for: indexPath.row)
        case 1:
            return triggerFetchFilmsPlanets(for: indexPath.row)
        case 2:
            return triggerFetchFilmsStarship(for: indexPath.row)
            
        default: break
            
        }
        
        
    }
    
}


