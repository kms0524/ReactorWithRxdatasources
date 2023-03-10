//
//  InfoAPI.swift
//  ServiceModule
//
//  Created by 강민성 on 2023/02/14.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation

protocol InfoAPIProtocol {
    func getInfos(completion: @escaping (BaseResponseType<InfoDTO.Response.getInfoResponseDTO>?, Error?) -> Void)
}

public final class InfoAPI: APIRequestLoader<InfoService>, InfoAPIProtocol {
    
    public func getInfos(completion: @escaping (BaseResponseType<InfoDTO.Response.getInfoResponseDTO>?, Error?) -> Void) {
        
        fetchData(target: .getInfo, responseType: BaseResponseType<InfoDTO.Response.getInfoResponseDTO>.self
        ) { response, error in
            
            completion(response, error)
            
        }
    }
    
}
