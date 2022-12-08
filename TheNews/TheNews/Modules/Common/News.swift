//
//  News.swift
//  TheNews
//
//  Created by vtsyganov on 04.12.2022.
//

import Foundation

struct NewsResponse: Codable {
    let results: [News]
}

struct News: Codable, Hashable, Identifiable, Equatable {
    let id: String = UUID().uuidString
    var title: String
    var url: String
    var keywords: [String]?
    var creator: [String]?
    var description: String?
    var content: String?
    var publishedAt: String
    var fullDescription: String?
    var imageURL: String?
    var sourceID: String?
    var country: [String]?
    var category: [NewsCategory]
    var language: String

    private enum NewsCodingKeys: String, CodingKey {
        case title = "title"
        case url = "link"
        case keywords = "keywords"
        case creator = "creator"
        case description = "description"
        case content = "content"
        case publishedAt = "pubDate"
        case fullDescription = "full_description"
        case imageURL = "image_url"
        case sourceID = "source_id"
        case country = "country"
        case category = "category"
        case language = "language"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: NewsCodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.url = try container.decode(String.self, forKey: .url)
        self.keywords = try container.decode([String]?.self, forKey: .keywords)
        self.creator = try container.decode([String]?.self, forKey: .creator)
        self.description = try container.decode(String?.self, forKey: .description)
        self.content = try container.decode(String?.self, forKey: .content)
        self.publishedAt = try container.decode(String.self, forKey: .publishedAt)
        self.fullDescription = try? container.decode(String?.self, forKey: .fullDescription)
        self.imageURL = try container.decode(String?.self, forKey: .imageURL)
        self.sourceID = try container.decode(String?.self, forKey: .sourceID)
        self.country = try container.decode([String]?.self, forKey: .country)
        self.category = try container.decode([NewsCategory].self, forKey: .category)
        self.language = try container.decode(String.self, forKey: .language)
    }

    init(title: String, url: String, publishedAt: String, category: [NewsCategory] = [.top], language: String) {
        self.title = title
        self.url = url
        self.publishedAt = publishedAt
        self.category = category
        self.language = language
    }

}

extension Array where Element == News {
    func indexOfNews(with id: News.ID) -> Self.Index {
        guard let index = firstIndex(where: { $0.id == id }) else {
            fatalError()
        }
        return index
    }
}

#if DEBUG
extension News {
    static let dummyNews: [News] = [
        News(title: "New news 1", url: "default1", publishedAt: "11-12-2022", language: "ru"),
        News(title: "New news 2", url: "default2", publishedAt: "12-12-2022", language: "en"),
        News(title: "New news 3", url: "default1", publishedAt: "13-12-2022", language: "uk"),
        News(title: "New news 4", url: "default2", publishedAt: "14-12-2022", language: "ch")
    ]
}
#endif
