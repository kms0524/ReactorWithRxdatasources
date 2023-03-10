//
//  InfoResponseDTO.swift
//  ServiceModule
//
//  Created by 강민성 on 2023/02/14.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation

//public extension InfoDTO.Response {
//    struct getInfosResponseDTO: Decodable {
//        public let infos: InfoList
//    }
//}

public extension InfoDTO.Response {
    struct getInfoResponseDTO: Decodable {
        
        public let lastWeek: [InfoListData]
        public let lastWeekCount: Int
        
        public let today: [InfoListData]
        public let todayCount: Int
        
        public let thisWeek: [InfoListData]
        public let thisWeekCount: Int
        
        public let nextWeek: [InfoListData]
        public let nextWeekCount: Int
    }
}
//
public struct InfoList: Codable {
    public let lastWeek: [InfoListData]
    public let lastWeekCount: Int

    public let today: [InfoListData]
    public let todayCount: Int

    public let thisWeek: [InfoListData]
    public let thisWeekCount: Int

    public let nextWeek: [InfoListData]
    public let nextWeekCount: Int
    
    public init(lastWeek: [InfoListData], lastWeekCount: Int, today: [InfoListData], todayCount: Int, thisWeek: [InfoListData], thisWeekCount: Int, nextWeek: [InfoListData], nextWeekCount: Int) {
        self.lastWeek = lastWeek
        self.lastWeekCount = lastWeekCount
        self.today = today
        self.todayCount = todayCount
        self.thisWeek = thisWeek
        self.thisWeekCount = thisWeekCount
        self.nextWeek = nextWeek
        self.nextWeekCount = nextWeekCount
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
