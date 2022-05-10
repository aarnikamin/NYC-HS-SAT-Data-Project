//
//  SchoolDataModel.swift
//  NYHighSchoolProject
//

import Foundation
import UIKit

extension SchoolViewController {

    func setupConstraintsAndTableViewDelegates() {
        self.view.addSubview(schoolTableView)
        schoolTableView.translatesAutoresizingMaskIntoConstraints = false
        schoolTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        schoolTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        schoolTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        schoolTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        schoolTableView.delegate = self
        schoolTableView.dataSource = self
        schoolTableView.register(SchoolListDataCell.self, forCellReuseIdentifier: "schoolCell")
        schoolTableView.backgroundColor = .black
    }
    
    func setupNavigationController() {
        navigationItem.title = "List of NY High Schools"
        let navTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = navTextAttributes
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    // Use this method to parse the json data received from the NY High School api
    func loadSchoolListData() {
        guard let endpoint = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json") else { return }

        URLSession.shared.dataTask(with: endpoint) {(data, response, error) in

            do {
                let additionalSchoolData = try JSONDecoder().decode([NYCHighSchoolsData].self, from: data!)
                DispatchQueue.main.async {
                    self.additionalSchoolData = additionalSchoolData
                    self.schoolTableView.reloadData()
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
    // Use this method to parse the json data received from the SAT data api
    func loadSATData() {
        guard let endpoint = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json") else { return }

        URLSession.shared.dataTask(with: endpoint) {(data, response, error) in

            do {
                let satData = try JSONDecoder().decode([SATData].self, from: data!)
                DispatchQueue.main.async {
                    self.satData = satData
                    self.schoolTableView.reloadData()
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
