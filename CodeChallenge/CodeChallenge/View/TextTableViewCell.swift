//
//  TextTableViewCell.swift
//  CodeChallenge
//
//  Created by GWL on 07/10/20.
//  Copyright © 2020 GWL. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell {
    
    var data:Info? {
        didSet {
            guard let dataItem = data else {return}
            dateLabel.text = "NA"
            detailLabel.text = "NA"

            if let date = dataItem.date {
                dateLabel.text = date.count>0 ? " \(date) " : "NA"
            }
            if let data = dataItem.data {
                if dataItem.type == "image" {
                } else {
                    detailLabel.text = data.count>0 ? " \(data) " : "NA"
                }
            }
        }
    }
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
  
    let detailLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        return label
    }()
    
    let dateLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor =  .white
        label.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        containerView.addSubview(detailLabel)
        containerView.addSubview(dateLabel)
        self.contentView.addSubview(containerView)
        
        containerView.topAnchor.constraint(equalTo:self.contentView.topAnchor, constant:10).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:30).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-30).isActive = true
        containerView.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor, constant:-10).isActive = true

        detailLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor, constant:10).isActive = true
        detailLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor, constant:30).isActive = true
        
        dateLabel.topAnchor.constraint(equalTo:self.detailLabel.bottomAnchor, constant:5).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


