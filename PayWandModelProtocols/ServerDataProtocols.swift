//
//  ServerDataProtocols.swift
//  PayWandModelProtocols
//
//  Created by Farid on 12/15/16.
//  Copyright © 2016 ParsPay. All rights reserved.
//

import Foundation

@objc public protocol GenericResponse {
    
    var status: Int { get set }
    var message: String { get set }
}

@objc public protocol DictionaryResponse {
    var dict: [ String: String ] { get set }
}
