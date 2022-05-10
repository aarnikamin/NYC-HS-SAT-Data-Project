//
//  SchoolListDataCell.swift
//  NYHighSchoolProject
//

import UIKit

class SchoolListDataCell: UITableViewCell {
        
    let schoolLabel:UILabel = {
            let label = UILabel()
            label.font = UIFont(name: "San Francisco", size: 12)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 2
            label.lineBreakMode = .byWordWrapping
            return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViewsAndConstraints()
    }
    
    func addViewsAndConstraints() {
        self.contentView.addSubview(schoolLabel)
        schoolLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        schoolLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        schoolLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
        schoolLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        schoolLabel.widthAnchor.constraint(equalTo: schoolLabel.heightAnchor, multiplier: 6).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
