//
//  Category.swift
//  TheNews
//
//  Created by vtsyganov on 05.12.2022.
//

import Foundation

enum NewsCategory: Codable, CaseIterable {
    case business, entertainment, environment, food, health, politics, science, sports, technology, top, world, other

    static var allCases: [NewsCategory] {
        [.business, .entertainment, .environment, .food, .health, .politics, .science, sports, .technology, .top, .world, .other]
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let category = try? container.decode(String.self)
        switch category {
        case "business": self = .business
        case "entertainment": self = .entertainment
        case "environment": self = .environment
        case "food": self = .food
        case "health": self = .health
        case "politics": self = .politics
        case "science": self = .science
        case "sports": self = .sports
        case "technology": self = .technology
        case "top": self = .top
        case "world": self = .world
        default:
            self = .other
        }
    }
}
