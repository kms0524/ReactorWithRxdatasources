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
    
    public enum Action {
        case viewWillAppear
    }
    
    public enum Mutation {
        case setSections([MainCollectionViewSectionModel])
        case setError(String?)
    }
    
    public struct State {
        var sections: [MainCollectionViewSectionModel]
        var error: String? = nil
    }
    
    public var initialState: State
    var provider: ServiceProviderType
    
    public init(sections: [MainCollectionViewSectionModel], provider: ServiceProviderType) {
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
        }
        
        return newState
    }
    
    public func transform(mutation: Observable<Mutation>) -> Observable<Mutation> {
        
        let serviceMutation = provider.infoRepository.event.flatMap { event -> Observable<Mutation> in
            
            switch event {
            case .getinfos(let infos):

                let lastWeek = infos.lastWeek.map {
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
                
                let today = infos.today.map {
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
                
                let thisWeek = infos.thisWeek.map {
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
                
                let nextWeek = infos.nextWeek.map {
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
                
                let lastWeekSection = MainCollectionViewSectionModel.lastWeekSection(lastWeek)
                let todaySection = MainCollectionViewSectionModel.todaySection(today)
                let thisWeekSection = MainCollectionViewSectionModel.thisWeekSection(thisWeek)
                let nextWeekSection = MainCollectionViewSectionModel.nextWeekSection(nextWeek)
                
                let sectionObservable = Mutation.setSections([lastWeekSection, todaySection, thisWeekSection, nextWeekSection])
                
                let total = Observable.of(sectionObservable)
                
                return total
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
