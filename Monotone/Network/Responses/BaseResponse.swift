//
//  BaseResponse.swift
//  Monotone
//
//  Created by Xueliang Chen on 2020/11/1.
//

import Foundation
import ObjectMapper

protocol BaseResponseProtocol {
    // FIXME: to add.
}

class BaseResponse : Mappable, BaseResponseProtocol{
    init() {
        // Implemented by subclass
    }
    
    required init?(map: Map) {
        // Implemented by subclass
    }
    
    func mapping(map: Map) {
        // Implemented by subclass
    }
    
    
}

