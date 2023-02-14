//
//  InfoResponseDTO.swift
//  ServiceModule
//
//  Created by 강민성 on 2023/02/14.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation

public extension InfoDTO.Response {
    struct getInfosResponseDTO: Decodable {
        public let infos: InfoList
    }
}

public struct InfoList: Codable {
    public let lastWeek: [InfoListData]
    public let lastWeekCount: Int
    
    public let today: [InfoListData]
    public let todayCount: Int
    
    public let thisWeek: [InfoListData]
    public let thisWeekCount: Int
    
    public let nextWeek: [InfoListData]
    public let nextWeekCount: Int
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
