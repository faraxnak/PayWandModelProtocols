//
//  CoreDataProtocols.swift
//  PayWandModelProtocols
//
//  Created by Farid on 12/15/16.
//  Copyright © 2016 ParsPay. All rights reserved.
//

import Foundation
import CoreData

@objc public protocol DataP {
    func updateServer(onFinish : () -> ())
    
    func reloadFromServer(onFinish : () -> ())
    
    //static func fetch(params : DataProtocol) -> DataProtocol
    
    func store()
    
    init(coreDataObject : NSManagedObject?)
    
    init(frcResult result : NSFetchRequestResult?)
    
}

@objc public protocol CountryP : DataP {
    
    var name: String? {get set}
    var id: Int {get set}
    var phoneCode: String? {get set}
    var code : String? {get set}
    var currency : String? {get set}
    
//    static func fetch(id : NSNumber?, name : String?, code : String?) -> CountryP?
//    
//    static func setCountryFRC(countryFRC fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>, id : NSNumber?, name : String?, code : String?)
}

extension Equatable where Self : CountryP
{
    
}

public func == (lhs: CountryP?, rhs: CountryP?) -> Bool {
    return lhs?.id == rhs?.id
}

@objc public protocol UserP : DataP {
    var address : String? {get set}
    var birthDate : Date? {get set}
    var city : String? {get set}
    var email : String? {get set}
    var firstName : String? {get set}
    var lastName : String? {get set}
    var nationalCode : String? {get set}
    var password : String? {get set}
    var phoneNumber : String? {get set}
    var pin : String? {get set}
    var postalCode : String? {get set}
    var username : String {get set}
    var country : CountryP? {get set}
    var profileImage : UIImage? {get set}
    var phoneVerificationCode : String? {get set}
    var wallets : [WalletP]? {get set}
    var currency : CurrencyP? {get set}
    var token : TokenP? {get set}
    var state : String? {get set}
    var isPhoneVerified : Bool {get set}
    var isAccountCreated: Bool {get set}
    
    
}


@objc public protocol ProfileImageProtocol : DataP {
    var image : UIImage? {get set}
}

@objc public protocol TransactionP : DataP {
    var type : TransactionTypeP? {get set}
    var date : Date? {get set}
    var cost : Double {get set}
    var amount : Double {get set}
    var middleCurrency : CurrencyP? {get set}
    var changedWallet : WalletP? {get set}
    var beforeWalletAmount : Double {get set}
    var afterWalletAmount : Double {get set}
    var sourceName : String? {get set}
    var sourceCurrency : CurrencyP? {get set}
    var destinationMobileNumber : String? {get set}
    var destinationName : String? {get set}
    var destinationCurrency: CurrencyP? {get set}
    var bankAccount : BankAccountP? {get set}
    var exchangeRate : Double {get set}
    var merchant : MerchantP? {get set}
}

@objc public protocol BankAccountP : DataP {
    var type : Int {get set}
    var cardNumber : String? {get set}
    var IBAN : String? {get set}
    var state : Int {get set}
    var bankNameId : Int {get set}
    var id : Int {get set}
    var currency : CurrencyP? {get set}
}

@objc public protocol MerchantP : DataP {
    var id : String? {get set}
    var mDescription : String? {get set}
    var serviceTypeId : Int {get set}
    var title : String? {get set}
    var websiteAddress : String? {get set}
}

@objc public protocol TransactionTypeP : DataP, NSObjectProtocol {
    var id : Int {get set}
    var name : String? {get set}
    
    var type : TransactionTypeE { get }
}

@objc public enum TransactionTypeE : Int {
    case select = 0
    case topup = 1
    case send = 2
    case exchange = 3
    case cashOut = 4
    case buy = 5
}

@objc public protocol CurrencyP : DataP, NSObjectProtocol {
    var id : Int {get set}
    var title : String? {get set}
    var symbol : String? {get set}
}

extension Equatable where Self : CurrencyP
{
    
}

public func == (lhs: CurrencyP?, rhs: CurrencyP?) -> Bool {
    return lhs?.id == rhs?.id
}

@objc public protocol WalletP : DataP {
    var currency : CurrencyP? {get set}
    var amount : Double {get set}
    var id : Int {get set}
    var title : String? {get set}
    var selected : Bool {get set}
    var user : UserP? {get set}
    var transactions : [TransactionP]? {get set}
    
    func amountString() -> String
}

@objc public protocol TokenP : DataP {
    var accessToken : String? {get set}
    var tokenType : String? {get set}
    var expiresIn : NSNumber? {get set}
    var issued : Date? {get set}
    var expires : Date? {get set}
}

@objc public protocol ExchangeModelP : DataP {
    var currentCurrency : CurrencyP? {get set}
    var destinationCurrency : CurrencyP? {get set}
    var rate : Float {get set}
    var transactionFee : Float {get set}
}


//
//class ProfileImageMO : NSManagedObject {
//    @NSManaged var imageData : Data?
//    var image : UIImage? {
//        get {
//            if (imageData != nil) {
//                return UIImage(data: imageData!)
//            } else {
//                return nil
//            }
//        }
//        set {
//            imageData = UIImageJPEGRepresentation(newValue!, 1)
//            do {
//                try DataController.sharedInstance.managedObjectContext.save()
//            } catch {
//                print("error in saving image : \(error)")
//            }
//        }
//    }
//}
//
//class AccountInfoMO : NSManagedObject {
//    @NSManaged var ownerInfo : String
//    @NSManaged var ownerName : String?
//    @NSManaged var ownerNextInfo : String?
//    @NSManaged var accountType : AccountTypeMO?
//}
//
//class AccountTypeMO : NSManagedObject {
//    @NSManaged var id : NSNumber
//    @NSManaged var name : String
//    
//    enum AccountType : NSNumber {
//        case select = 0
//        case card = 1
//        case bankAccount = 2
//        case payPal = 3
//        case payWand = 4
//    }
//    
//    var type : AccountType {
//        get {
//            return AccountType.init(rawValue: id)!
//        }
//    }
//}

