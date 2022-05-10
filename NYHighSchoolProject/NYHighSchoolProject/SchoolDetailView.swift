//
//  SchoolDetailView.swift
//  NYHighSchoolProject
//

import Foundation
import UIKit

class SchoolDetailView: UIViewController {
        
    lazy var nameOfSchool:UILabel = {
        let label = UILabel()
            label.font = UIFont(name: "San Francisco", size: 20)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 3
            label.lineBreakMode = .byWordWrapping
            return label
    }()
    
    lazy var mathScore:UIButton = {
        let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = UIColor.darkGray
            button.titleLabel?.font = UIFont(name: "San Francisco", size: 20)
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 15
            return button
    }()
    
    lazy var readingScore:UIButton = {
        let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = UIColor.darkGray
            button.titleLabel?.font = UIFont(name: "San Francisco", size: 20)
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 15
            return button
    }()
    
    lazy var writingScore:UIButton = {
        let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = UIColor.darkGray
            button.titleLabel?.font = UIFont(name: "San Francisco", size: 20)
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 15
            return button
    }()
    
    lazy var contactTitle:UILabel = {
        let label = UILabel()
            label.font = UIFont(name: "San Francisco", size: 20)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            return label
    }()
    
    let phoneNumber:UIButton = {
        let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = UIColor.darkGray
            button.titleLabel?.font = UIFont(name: "San Francisco", size: 20)
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 15
            return button
    }()
    
    let faxNumber:UIButton = {
        let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = UIColor.darkGray
            button.titleLabel?.font = UIFont(name: "San Francisco", size: 20)
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 15
            return button
    }()
    
    let neighborhood:UIButton = {
        let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = UIColor.darkGray
            button.titleLabel?.font = UIFont(name: "San Francisco", size: 20)
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 15
            button.titleLabel?.numberOfLines = 2
            button.titleLabel?.lineBreakMode = .byWordWrapping
            return button
    }()
    
    lazy var stackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        stackView.axis = .vertical
        return stackView
    }()
    
    func creatStackConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40))
        constraints.append(stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40))
        constraints.append(stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20))
        constraints.append(stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func addSubviews() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(nameOfSchool)
        stackView.addArrangedSubview(readingScore)
        stackView.addArrangedSubview(mathScore)
        stackView.addArrangedSubview(writingScore)
        stackView.addArrangedSubview(contactTitle)
        stackView.addArrangedSubview(phoneNumber)
        stackView.addArrangedSubview(faxNumber)
        stackView.addArrangedSubview(neighborhood)
  
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemTeal
        addSubviews()
        creatStackConstraints()
    }
}
