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

import ServiceModule

class MainReactor: ReactorKit.Reactor {
    enum Action {
        case viewWillAppear
    }
    
    enum Mutation {
        case setSections([MainCollectionViewSectionModel?])
        case setError(String?)
    }
    
    struct State {
        var sections: [MainCollectionViewSectionModel?]
        var error: String? = nil
    }
    
    var initialState: State
    var provider: ServiceProviderType
    
    init(sections: [MainCollectionViewSectionModel], provider: ServiceProviderType) {
        self.initialState = State(sections: sections)
        self.provider = provider
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewWillAppear:
            provider.infoRepository.getInfos()
            return .empty()
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        switch mutation {
        case .setSections(let sections):
            newState.sections = sections
        case .setError(let error):
            newState.error = error
        }
        
        return newState
    }
    
    func transform(mutation: Observable<Mutation>) -> Observable<Mutation> {
        let serviceMutation = provider.infoRepository.event.flatMap { event -> Observable<Mutation> in
            
            switch event {
            case .getinfos(let infos):
                /*
                 lastWeek
                 today
                 thisWeek
                 nextWeek
                 */
                
                var lastWeek = infos.lastWeek.map {
                    MainCollectionViewCellModel(category: $0.category, name: $0.name, count: $0.count, favorite: $0.favorite, backgroundColor: $0.backgroundColor)
                }
                
                var today = infos.today.map {
                    MainCollectionViewCellModel(category: $0.category, name: $0.name, count: $0.count, favorite: $0.favorite, backgroundColor: $0.backgroundColor)
                }
                
                var thisWeek = infos.thisWeek.map {
                    MainCollectionViewCellModel(category: $0.category, name: $0.name, count: $0.count, favorite: $0.favorite, backgroundColor: $0.backgroundColor)
                }
                
                var nextWeek = infos.nextWeek.map {
                    MainCollectionViewCellModel(category: $0.category, name: $0.name, count: $0.count, favorite: $0.favorite, backgroundColor: $0.backgroundColor)
                }
                
                var sections = [MainCollectionViewSectionModel(time: "저번주", count: infos.lastWeekCount, items: lastWeek), MainCollectionViewSectionModel(time: "오늘", count: infos.todayCount, items: today), MainCollectionViewSectionModel(time: "이번주", count: infos.thisWeekCount, items: thisWeek), MainCollectionViewSectionModel(time: "다음주", count: infos.nextWeekCount, items: nextWeek)]
                
                return .just(Mutation.setSections(sections))
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
