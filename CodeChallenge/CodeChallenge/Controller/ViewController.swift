//
//  ViewController.swift
//  CodeChallenge
//
//  Created by GWL on 02/10/20.
//  Copyright © 2020 GWL. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var arrData = [] as [Info]
    
    let dataTableView = UITableView() // view
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(dataTableView)
        
        dataTableView.translatesAutoresizingMaskIntoConstraints = false
        dataTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        dataTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        dataTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        dataTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        dataTableView.dataSource = self
        dataTableView.delegate = self
        
        //Register Custom cells
        dataTableView.register(DataTableViewCell.self, forCellReuseIdentifier: "DataTableViewCell")
        dataTableView.register(TextTableViewCell.self, forCellReuseIdentifier: "TextTableViewCell")
        
        //Get stored Data
        let realm = try! Realm()
        let results =  realm.objects(Info.self)
        print("Realm results: \(results)")
        self.arrData = Array(results)
        self.arrData = self.arrData.sorted(by: { ($0.type!) < ($1.type!) })
        
        //Get data from Api
        DataAPI().doRequest(completion: { (res, err) in
            if let arrData = res {
                if arrData is [Info] {
                    self.arrData = res as! [Info]
                    self.arrData = self.arrData.sorted(by: { ($0.type!) < ($1.type!) })
                    print(self.arrData)
                    self.dataTableView.reloadData()
                }
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = arrData[indexPath.row]
        if info.type == "image" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DataTableViewCell", for: indexPath) as! DataTableViewCell
            cell.data = arrData[indexPath.row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextTableViewCell", for: indexPath) as! TextTableViewCell
            cell.data = arrData[indexPath.row]
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.data = arrData[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
