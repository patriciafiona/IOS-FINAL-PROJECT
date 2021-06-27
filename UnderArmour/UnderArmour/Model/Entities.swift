//
//  Products.swift
//  UnderArmour
//
//  Created by Patricia Fiona on 27/06/21.
//

import Foundation

struct Products: Codable{
    let id: Int
    let name: String
    let category: Int
    let tag: Int
    let rating: Double
    let price: Double
    let stock: Int
    let color: String
    let description: String
    let created_at: String
    let updated_at: String
    let category_name: String
    let tag_name: String
    let photo_01: String
    let photo_02: String
    let photo_03: String
    let photo_04: String
    let photo_05: String
}
