//
//  CoreDataProtocols.swift
//  PayWandModelProtocols
//
//  Created by Farid on 12/15/16.
//  Copyright © 2016 ParsPay. All rights reserved.
//

import Foundation

@objc public protocol CountryProtocol {
    
    var name: String! {get set}
    var id: NSNumber! {get set}
    var phoneCode: String! {get set}
    var code : String! {get set}
    var currency : String! {get set}
    
}
