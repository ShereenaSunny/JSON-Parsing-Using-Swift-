//
//  Model.swift
//  Assignment1
//
//  Created by Shereena Sunny on 21/03/22.
//

import Foundation

struct DataModel: Codable {
    var person : [Person]
    var company : [Company]
}

struct Person: Codable, Hashable {
    var name: String?
    var age: String
    var employed: Bool?
    var companyName: String?
    
}

struct Company: Codable, Hashable {
    var id: String?
    var name: String?
}
