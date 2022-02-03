//
//  Photo.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 03.02.2022.
//

import Foundation

class Photo: Identifiable {
    let id: UUID = UUID()
    let name: String
    
    init(name: String) {
        self.name = name
    }
}
