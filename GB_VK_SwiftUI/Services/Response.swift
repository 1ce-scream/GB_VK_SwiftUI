//
//  Response.swift
//  VKApp_TalalayVV
//
//  Created by Vitaliy Talalay on 07.10.2021.
//

import Foundation

class Response<T: Codable>: Codable {
    let response: Items<T>
}

class Items<T: Codable>: Codable {
    let items: [T]
}

class ResponseJoin: Codable {
    let response: Int
}

class VKResponse<T:Codable>: Codable {
    let response: ResponseNews<T>
}

class ResponseNews<T: Codable>: Codable {
    let items: [T]
    let profiles: [User]?
    let groups: [Community]?
    let nextFrom: String?
    
    enum CodingKeys: String, CodingKey {
        case items
        case profiles
        case groups
        case nextFrom = "next_from"
    }
}
