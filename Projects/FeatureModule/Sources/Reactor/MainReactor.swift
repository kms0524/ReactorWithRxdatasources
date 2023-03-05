//
//  MainReactor.swift
//  FeatureModule
//
//  Created by 강민성 on 2023/02/14.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import UIKit
import RxSwift
import ReactorKit
import Alamofire
import RxDataSources
import Then
import Reusable

import ServiceModule

public class MainReactor: ReactorKit.Reactor {
    
    enum CellType {
        case item(String, String, String, String, String)
    }
    
    public enum Action {
        case viewWillAppear
    }
    
    public enum Mutation {
        case setSections([MainCollectionViewSectionModel?])
        case setLastWeekCount(Int?)
        case setToadyCount(Int?)
        case setThisWeekCount(Int?)
        case setNextWeekCount(Int?)
        case setError(String?)
    }
    
    public struct State {
        var sections: [MainCollectionViewSectionModel?]
        var lastWeekCount: Int?
        var todayCount: Int?
        var thisWeekCount: Int?
        var nextWeekCount: Int?
        var error: String? = nil
    }
    
    public var initialState: State
    var provider: ServiceProviderType
    
    init(sections: [MainCollectionViewSectionModel], provider: ServiceProviderType) {
        self.initialState = State(sections: sections)
        self.provider = provider
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewWillAppear:
            provider.infoRepository.getInfos()
            return .empty()
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        switch mutation {
        case .setSections(let sections):
            newState.sections = sections
        case .setError(let error):
            newState.error = error
            
        case .setLastWeekCount(let lastWeekCount):
            newState.lastWeekCount = lastWeekCount
            
        case .setToadyCount(let todayCount):
            newState.todayCount = todayCount
            
        case .setThisWeekCount(let thisWeekCount):
            newState.thisWeekCount = thisWeekCount
            
        case .setNextWeekCount(let nextWeekCount):
            newState.nextWeekCount = nextWeekCount
        }
        
        return newState
    }
    
    public func transform(mutation: Observable<Mutation>) -> Observable<Mutation> {
        
        let serviceMutation = provider.infoRepository.event.flatMap { event -> Observable<Mutation> in
            
            switch event {
            case .getinfos(let infos):

                var lastWeek = infos.lastWeek.map {
                    MainCollectionViewSectionItem
                        .item(MainCollectionViewCellReactor(
                            item: MainCollectionViewCellModel(
                                category: $0.category,
                                name: $0.name,
                                count: $0.count,
                                favorite: $0.favorite,
                                backgroundColor: $0.backgroundColor
                            )
                        ))
                }
                
                var today = infos.today.map {
                    MainCollectionViewSectionItem
                        .item(MainCollectionViewCellReactor(
                            item: MainCollectionViewCellModel(
                                category: $0.category,
                                name: $0.name,
                                count: $0.count,
                                favorite: $0.favorite,
                                backgroundColor: $0.backgroundColor
                            )
                        ))
                }
                
                var thisWeek = infos.thisWeek.map {
                    MainCollectionViewSectionItem
                        .item(MainCollectionViewCellReactor(
                            item: MainCollectionViewCellModel(
                                category: $0.category,
                                name: $0.name,
                                count: $0.count,
                                favorite: $0.favorite,
                                backgroundColor: $0.backgroundColor
                            )
                        ))
                }
                
                var nextWeek = infos.nextWeek.map {
                    MainCollectionViewSectionItem
                        .item(MainCollectionViewCellReactor(
                            item: MainCollectionViewCellModel(
                                category: $0.category,
                                name: $0.name,
                                count: $0.count,
                                favorite: $0.favorite,
                                backgroundColor: $0.backgroundColor
                            )
                        ))
                        
                }

                var lastWeekCount = Mutation.setLastWeekCount(infos.lastWeekCount)

                var todayCount = Mutation.setLastWeekCount(infos.todayCount)

                var thisWeekCount = Mutation.setLastWeekCount(infos.thisWeekCount)

                var nextWeekCount = Mutation.setLastWeekCount(infos.nextWeekCount)
                
                var lastWeekSection = MainCollectionViewSectionModel.lastWeekSection(lastWeek)
                var todaySection = MainCollectionViewSectionModel.todaySection(today)
                var thisWeekSection = MainCollectionViewSectionModel.thisWeekSection(thisWeek)
                var nextWeekSection = MainCollectionViewSectionModel.nextWeekSection(nextWeek)
                
                var sectionObservable = Mutation.setSections([lastWeekSection, todaySection, thisWeekSection, nextWeekSection])
                
                var total = Observable.of(sectionObservable, lastWeekCount, todayCount, thisWeekCount, nextWeekCount)
                
                return total
//                return .just(Mutation.setSections([lastWeekSection, todaySection, thisWeekSection, nextWeekSection]))
            case .sendError(let error):
                guard let error = error else {
                    return .empty()
                }
                return Observable.just(.setError(error.message))
            }
        }
        return Observable.merge(mutation, serviceMutation)
    }
}

//extension MainReactor {
//
//    private func sections(infos: InfoList?) -> [MainCollectionViewSectionModel] {
//
//        guard let infos = infos else {
//             return []
//        }
//
//        let items: InfoList
//
////        let items: [MainCollectionViewSectionItem] = infos.map { item in
////            let cellReactor = MainCollectionViewCellReactor(item: item)
////            return .item(cellReactor)
////        }
//
//        return items.count > 0 ? [.section(items)] : []
//    }
//}
