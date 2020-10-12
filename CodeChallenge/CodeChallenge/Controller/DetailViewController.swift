//
//  DetailViewController.swift
//  CodeChallenge
//
//  Created by GWL on 02/10/20.
//  Copyright © 2020 GWL. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var isText = false
    var data:Info? {
        didSet {
            guard let dataItem = data else {return}
            dateLabel.text = "NA"
            detailLabel.text = "NA"
            dataLabel.text = "NA"

            if let date = dataItem.date  {
                 dateLabel.text = date.count > 0 ? "\(date)" : "NA"
            }
            if let id = dataItem.id {
                dataLabel.text = id.count > 0 ? "\(id)" : "NA"
            }
            if dataItem.type == "image" {
                print(dataItem.data!)
                let imageString = dataItem.data ?? ""
                self.profileImageView.sd_setImage(with: URL(string: imageString), placeholderImage: UIImage(named: "placeholder"))
            } else {
                if let data = dataItem.data {
                    detailLabel.text = data.count > 0 ? "\(data)" : "NA"
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        containerView.addSubview(detailLabel)
        containerView.addSubview(dateLabel)
        containerView.addSubview(dataLabel)
        containerView.addSubview(idLabelStatic)
        containerView.addSubview(dateLabelStatic)
        self.view.addSubview(containerView)
        if self.data?.type == "image" {
            self.view.addSubview(profileImageView)
            profileImageView.topAnchor.constraint(equalTo:self.view.topAnchor, constant:70).isActive = true
            profileImageView.centerXAnchor.constraint(equalTo:self.view.centerXAnchor).isActive = true
            profileImageView.widthAnchor.constraint(equalToConstant:100).isActive = true
            profileImageView.heightAnchor.constraint(equalToConstant:100).isActive = true
            
            containerView.topAnchor.constraint(equalTo:self.profileImageView.bottomAnchor, constant:20).isActive = true
            
        } else {
            containerView.topAnchor.constraint(equalTo:self.view.topAnchor, constant:90).isActive = true
        }

        containerView.centerYAnchor.constraint(equalTo:self.view.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.view.leadingAnchor, constant:20).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.view.trailingAnchor, constant:-20).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:200).isActive = true
        detailLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        detailLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor, constant:10).isActive = true

        dateLabel.leadingAnchor.constraint(equalTo:self.dateLabelStatic.trailingAnchor, constant:10).isActive = true
        dateLabel.topAnchor.constraint(equalTo:self.detailLabel.bottomAnchor, constant:10).isActive = true
        
        dateLabelStatic.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        dateLabelStatic.topAnchor.constraint(equalTo:self.detailLabel.bottomAnchor, constant:10).isActive = true

        idLabelStatic.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        idLabelStatic.topAnchor.constraint(equalTo:self.dateLabel.bottomAnchor, constant:8).isActive = true
        
        dataLabel.topAnchor.constraint(equalTo:self.dateLabel.bottomAnchor, constant:8).isActive = true
        dataLabel.leadingAnchor.constraint(equalTo:self.idLabelStatic.trailingAnchor, constant:10).isActive = true

    }
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    let profileImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        return img
    }()
    
    let detailLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.textAlignment = .justified
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 25
        return label
    }()
    
    let dataLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let dateLabelStatic:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.text = "Date:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let idLabelStatic:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.text = "Id:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let dateLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor =  .black
        label.text = ""
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
