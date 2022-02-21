//
//  Response.swift
//  VKApp_TalalayVV
//
//  Created by Vitaliy Talalay on 07.10.2021.
//

import Foundation

struct Response<T: Codable>: Codable {
    let response: T
    
    enum CodingKeys: String, CodingKey {
        case response
    }
}
