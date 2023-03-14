//
//  InfoResponseDTO.swift
//  ServiceModule
//
//  Created by 강민성 on 2023/02/14.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation

public extension InfoDTO.Response {
    
    struct getInfoResponseDTO: Decodable {
        public let lastWeek: [InfoListData]
        public let today: [InfoListData]
        public let thisWeek: [InfoListData]
        public let nextWeek: [InfoListData]
    }
}

public struct InfoList: Codable {
    
    public let lastWeek: [InfoListData]
    public let today: [InfoListData]
    public let thisWeek: [InfoListData]
    public let nextWeek: [InfoListData]
    
    public init(lastWeek: [InfoListData], today: [InfoListData], thisWeek: [InfoListData], nextWeek: [InfoListData]) {
        self.lastWeek = lastWeek
        self.today = today
        self.thisWeek = thisWeek
        self.nextWeek = nextWeek
    }
}

public struct InfoListData: Codable {
    
    public let category: String
    public let name: String
    public let count: String
    public let favorite: String
    public let backgroundColor: String
    
    public init(category: String, name: String, count: String, favorite: String, backgroundColor: String) {
        self.category = category
        self.name = name
        self.count = count
        self.favorite = favorite
        self.backgroundColor = backgroundColor
    }
}
