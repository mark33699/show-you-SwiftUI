//
//  Human.swift
//  FDLS
//
//  Created by FlyFat on 2022/10/9.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let humanList = try? newJSONDecoder().decode(HumanList.self, from: jsonData)

import Foundation

// MARK: - HumanList
struct HumanList: Codable {
    let humans: [Human]

    enum CodingKeys: String, CodingKey {
        case humans = "data"
    }
}

// MARK: - Datum
struct Human: Codable, Identifiable {
    let id: Int
    let email: String
    let firstName, lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email, avatar
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
