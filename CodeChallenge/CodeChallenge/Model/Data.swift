//
//  Data.swift
//  CodeChallenge
//
//  Created by GWL on 02/10/20.
//  Copyright © 2020 GWL. All rights reserved.
//

import Foundation
import RealmSwift

class Info : Object, Decodable {
    @objc dynamic var id: String?
    @objc dynamic var type: String?
    @objc dynamic var date: String?
    @objc dynamic var data: String?
}
