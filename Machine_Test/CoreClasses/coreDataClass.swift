//
//  coreDataClass.swift
//  Machine_Test
//
//  Created by Nixon on 25/05/21.
//

import Foundation

class dataSet{
    var first_name : String!
    var last_name : String!
    var email : String!
    var avatar: String!
    init(json : [String:Any]) {
        self.first_name = json["first_name"] as? String
        self.last_name = json["last_name"] as? String
        self.email = json["email"] as? String
        self.avatar = json["avatar"] as? String
    }
}
