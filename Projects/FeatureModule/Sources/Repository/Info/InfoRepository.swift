//
//  InfoRepository.swift
//  FeatureModule
//
//  Created by 강민성 on 2023/02/14.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation
import ServiceModule
import RxSwift
import RxCocoa

public enum InfoRepositoryEvent {
    case getinfos(InfoList)
    case sendError(ErrorModel?)
}

public protocol InfoRepository {
    var event: PublishSubject<InfoRepositoryEvent> { get }
    
    func getInfos()
    
}

public final class InfoRepositoryImp: BaseProvider, InfoRepository {
    
    public var event = PublishSubject<InfoRepositoryEvent>()
    
    public func getInfos() {
        NetworkService.shared.infoRepository.getInfos { [weak self] result, error in
            guard let self = self else { return }
            guard let data = result?.data else {
                let errorModel = ErrorModel(
                    success: result?.success,
                    status: result?.status,
                    message: result?.message
                )
                
                self.event.onNext(.sendError(errorModel))
                return
            }
            
            self.event.onNext(.getinfos(InfoList(lastWeek: data.lastWeek, lastWeekCount: data.lastWeekCount, today: data.today, todayCount: data.todayCount, thisWeek: data.thisWeek, thisWeekCount: data.thisWeekCount, nextWeek: data.nextWeek, nextWeekCount: data.nextWeekCount)))
        }
    }
    
    
}
