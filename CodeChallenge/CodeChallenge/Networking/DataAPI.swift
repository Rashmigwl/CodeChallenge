//
//  DataAPI.swift
//  CodeChallenge
//
//  Created by GWL on 02/10/20.
//  Copyright © 2020 GWL. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

class DataAPI {

    func doRequest( completion: @escaping (Any?, Error?) -> ()) {
        let request = AF.request("https://raw.githubusercontent.com/AxxessTech/Mobile-Projects/master/challenge.json").response { response in
            debugPrint("Response: \(response.result)")
        }
        request.responseDecodable(of: [Info].self) { response in
            switch response.result {
            case let .success(result):
                do {
                    let realm = try Realm()
                    let items = realm.objects(Info.self)
                    try! realm.write {
                        realm.delete(items)
                    }
                    try! realm.write {
                        realm.add(result)
                    }
                } catch {
                    print(error.localizedDescription)
                }
                
                completion(result, nil)
                // the decoded result of type 'Article' that you received from the server.
                
                print("Result is: \(result)")
            case let .failure(error):
                completion(nil, error)
                // Handle the error.
                print("Error description is: \(error.localizedDescription)")
            }
        }
    }
    
    func getImg (url:String,completion: @escaping (Data?, Error?) -> ()) {
       AF.request( url,method: .get).response{ response in
           switch response.result {
            case .success(let responseData):
                completion(responseData, nil)
            case .failure(let error):
                completion(nil, error)
                print("error--->",error)
            }
        }
    }
   
}
