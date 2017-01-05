//
//  CoreDataProtocols.swift
//  PayWandModelProtocols
//
//  Created by Farid on 12/15/16.
//  Copyright © 2016 ParsPay. All rights reserved.
//

import Foundation
import CoreData

@objc public protocol DataP : class {
    func updateServer(onFinish : () -> ())
    
    func reloadFromServer(onFinish : () -> ())
    
    //static func fetch(params : DataProtocol) -> DataProtocol
    
    func store()
    
    init(coreDataObject : NSManagedObject)
    
    init(frcResult result : NSFetchRequestResult)
    
}

@objc public protocol CountryP : DataP {
    
    var name: String? {get set}
    var id: NSNumber? {get set}
    var phoneCode: String? {get set}
    var code : String? {get set}
    var currency : String? {get set}
    
//    static func fetch(id : NSNumber?, name : String?, code : String?) -> CountryP?
//    
//    static func setCountryFRC(countryFRC fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>, id : NSNumber?, name : String?, code : String?)
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
    
//    static func fetch(username : String?, nationalCode : String?, firstName : String?, lastName : String?) -> UserP?
//    
//    static func setFRCPredicate()
}

@objc public protocol ProfileImageProtocol : DataP {
    var image : UIImage? {get set}
}

@objc public protocol TransactionP : DataP {
//    var wallet : WalletProtocol
    var amount : Double {get set}
}

@objc public protocol CurrencyP : DataP{
    var id : Int {get set}
    var title : String {get set}
    var symbol : String? {get set}
}

@objc public protocol WalletP : DataP {
    var walletCurrency : CurrencyP? {get set}
    var amount : Double {get set}
    var id : Int {get set}
    var title : String? {get set}
    var selected : Bool {get set}
    var user : UserP {get set}
    var walletTransaction : [TransactionP]? {get set}
}

@objc public protocol TokenP : DataP {
    var accessToken : String {get set}
    var tokenType : String? {get set}
    var expiresIn : NSNumber? {get set}
    var issued : Date? {get set}
    var expires : Date? {get set}
}


//class UserProfileMO : NSManagedObject {
//    var address : String?
//    var birthDate : Date?
//    var city : String?
//    var email : String?
//    var firstName : String?
//    var lastName : String?
//    @NSManaged var nationalCode : String?
//    @NSManaged var password : String?
//    @NSManaged var phoneNumber : String?
//    @NSManaged var pin : String?
//    @NSManaged var postalCode : String?
//    @NSManaged var username : String
//    @NSManaged var userCountry : CountryMO?
//    @NSManaged var userProfileImage : ProfileImageMO?
//    var profileImage : UIImage? {
//        get {
//            return userProfileImage?.image
//        }
//        set {
//            if (userProfileImage == nil){
//                userProfileImage = NSEntityDescription.insertNewObject(forEntityName: "ProfileImage", into: DataController.sharedInstance.managedObjectContext) as? ProfileImageMO
//            }
//            userProfileImage?.image = newValue
//        }
//    }
//    @NSManaged var phoneVerificationCode : String?
//    @NSManaged var userWallets : Set<WalletMO>?
//    var wallets : [WalletMO] {
//        get {
//            if let w = userWallets {
//                return w.sorted(by: { (a, b) -> Bool in
//                    return (a.id.intValue < b.id.intValue)
//                })
//            } else {
//                return [WalletMO]()
//            }
//        }
//    }
//    @NSManaged var userCurrency : CurrencyMO?
//    @NSManaged var userToken : TokenMO?
//    @NSManaged var state : String?
//    @NSManaged fileprivate var phoneVerified : NSNumber?
//    var isPhoneVerified: Bool {
//        get {
//            if (phoneVerified == nil){
//                return false
//            }
//            return Bool(phoneVerified!)
//        }
//        set {
//            phoneVerified = NSNumber(value: newValue as Bool)
//        }
//    }
//    @NSManaged fileprivate var accountCreated : NSNumber?
//    var isAccountCreated: Bool {
//        get {
//            if (accountCreated == nil){
//                return false
//            }
//            print(Bool(accountCreated!))
//            return Bool(accountCreated!)
//        }
//        set {
//            accountCreated = NSNumber(value: newValue as Bool)
//        }
//    }
//    
//    internal enum ProfileParameters : String {
//        case MobileNumber, CurrencyIdFK, FirstName, LastName, Email
//        case NationalCode, State, City, Address, PostalCode, BirthDate, PhoneNumber
//        case VerificationCode, Password, ConfirmPassword, CountryIdFk, PIN
//    }
//    
//    static func getPrimaryLabelTexts() -> [String]{
//        var primaryParamLabelTexts = [String]()
//        
//        primaryParamLabelTexts.append("Phone Number:")
//        primaryParamLabelTexts.append("Country:")
//        
//        return primaryParamLabelTexts
//    }
//    
//    static func primaryParameters() -> [ProfileParameters] {
//        let params : [ProfileParameters] = [.MobileNumber, .CountryIdFk]
//        return params
//    }
//    
//    static func craeteAccountParameters() -> [ProfileParameters]{
//        let params :[ProfileParameters] = [.FirstName, .LastName, .Email
//            , .Password , .ConfirmPassword, .CurrencyIdFK]
//        return params
//    }
//    
//    static func editProfileParameters() -> [ProfileParameters]{
//        let params : [ProfileParameters] = [.FirstName, .LastName, .Email ,.NationalCode, .State, .City, .Address ,.PostalCode, .BirthDate, .PhoneNumber, .CurrencyIdFK]
//        return params
//    }
//    
//    static func getEditProfileLabelTexts() -> [String]{
//        var secondaryParamLabelTexts : [String] = []
//        
//        secondaryParamLabelTexts.append("First Name:")
//        secondaryParamLabelTexts.append("Last Name:")
//        secondaryParamLabelTexts.append("Email:")
//        secondaryParamLabelTexts.append("National Code:")
//        secondaryParamLabelTexts.append("State:")
//        secondaryParamLabelTexts.append("City:")
//        secondaryParamLabelTexts.append("Address:")
//        secondaryParamLabelTexts.append("Postal Code:")
//        secondaryParamLabelTexts.append("Birth Date:")
//        secondaryParamLabelTexts.append("Phone number:")
//        secondaryParamLabelTexts.append("Currency:")
//        return secondaryParamLabelTexts
//    }
//    
//    static func getCreateAccountLabelTexts() -> [String]{
//        var secondaryParamLabelTexts : [String] = []
//        secondaryParamLabelTexts.append("First Name:")
//        secondaryParamLabelTexts.append("Last Name:")
//        secondaryParamLabelTexts.append("Email:")
//        secondaryParamLabelTexts.append("Password:")
//        secondaryParamLabelTexts.append("Retype Pass:")
//        secondaryParamLabelTexts.append("Currency:")
//        return secondaryParamLabelTexts
//    }
//    
//    func getParamValue(_ param : ProfileParameters) -> String? {
//        var value : String?
//        switch param {
//        case .Address:
//            value = self.address
//        case .BirthDate:
//            let df = DateFormatter ()
//            df.dateFormat = "yyyy-MM-dd"
//            if (birthDate != nil){
//                value = df.string(from: birthDate!)
//            } else {
//                value = ""
//            }
//        case .City:
//            value = self.city
//        case .CountryIdFk:
//            value = self.userCountry?.name
//        case .CurrencyIdFK:
//            value = self.userCurrency?.symbol
//        case .Email:
//            value = self.email
//        case .FirstName:
//            value = self.firstName
//        case .LastName:
//            value = self.lastName
//        case .MobileNumber:
//            value = self.username
//        case .NationalCode:
//            value = self.nationalCode
//        case .Password:
//            value = self.password
//        case .PhoneNumber:
//            value = self.phoneNumber
//        case .PostalCode:
//            value = self.postalCode
//        case .State:
//            value = self.state
//        case .VerificationCode:
//            value = self.phoneVerificationCode
//        case .PIN:
//            value = self.pin
//        case .ConfirmPassword:
//            value = self.password
//        }
//        return value
//    }
//    
//    func setParamValue(_ param : ProfileParameters, value : AnyObject){
//        switch param {
//        case .MobileNumber:
//            self.username = value as! String
//        case .Address:
//            self.address = value as? String
//        case .BirthDate:
//            self.birthDate = value as? Date
//        case .City:
//            self.city = value as? String
//        case .Password:
//            self.password = value as? String
//        case .CountryIdFk:
//            let id = value as! Int
//            self.userCountry = DataController.sharedInstance.fetchCountry(nil, id: id)[0]
//        case .CurrencyIdFK:
//            let id = value as! Int
//            self.userCurrency = DataController.sharedInstance.fetchCurrency(id)[0]
//        case .Email:
//            self.email = value as? String
//        case .FirstName:
//            self.firstName = value as? String
//        case .LastName:
//            self.lastName = value as? String
//        case .NationalCode:
//            self.nationalCode = value as? String
//        case .PhoneNumber:
//            self.phoneNumber = value as? String
//        case .PostalCode:
//            self.postalCode = value as? String
//        case .State:
//            self.state = value as? String
//        case .VerificationCode:
//            self.phoneVerificationCode = value as? String
//        case .PIN:
//            self.pin = value as? String
//        default:
//            return
//        }
//        do {
//            try DataController.sharedInstance.managedObjectContext.save()
//        } catch {
//            print("save failed with error \(error)")
//        }
//    }
//}
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
//class CurrencyMO : NSManagedObject {
//    @NSManaged var id : NSNumber
//    @NSManaged var title : String?
//    @NSManaged var symbol : String?
//}
//
//class WalletMO : NSManagedObject {
//    @NSManaged var walletCurrency : CurrencyMO
//    @NSManaged var amount : Double
//    @NSManaged var id : NSNumber
//    @NSManaged var title : String?
//    @NSManaged var selected : NSNumber?
//    @NSManaged var user : UserProfileMO
//    @NSManaged var walletTransaction : Set<TransactionMO>?
//}
//
//class TokenMO : NSManagedObject {
//    @NSManaged var accessToken : String
//    @NSManaged var tokenType : String?
//    @NSManaged var expiresIn : NSNumber?
//    @NSManaged var issued : Date?
//    @NSManaged var expires : Date?
//}
//
//class TransactionMO : NSManagedObject {
//    @NSManaged var afterWalletAmount : Double
//    @NSManaged var beforeWalletAmount : Double
//    @NSManaged var cost : Double
//    @NSManaged var date : Date
//    @NSManaged var destinationMobileNumber : String
//    @NSManaged var destinationName : String
//    @NSManaged var sourceName : String?
//    @NSManaged var transactionAmount : Double
//    @NSManaged var destinationCurrency : CurrencyMO?
//    @NSManaged var middleCurrency : CurrencyMO?
//    @NSManaged var sourceCurrency : CurrencyMO?
//    @NSManaged var wallet : WalletMO
//    //@NSManaged var transactionAccountInfo : AccountInfoMO?
//    @NSManaged var transactionType : TransactionTypeMO?
//    @NSManaged var exchangeRate : Double
//    @NSManaged var bankAccount : BankAccountMO?
//    @NSManaged var merchant : MerchantMO?
//    func csv() -> String {
//        //    let coalescedafterWalletAmount = afterWalletAmount ?? 0
//        //    let coalescedbeforeWalletAmount = beforeWalletAmount ?? 0
//        //    let coalescedWind = wind ?? ""
//        //    let coalescedLocation = location ?? ""
//        //    var coalescedRating:String
//        //    if let rating = rating?.intValue {
//        //    coalescedRating = String(rating)
//        //    } else {
//        //    coalescedRating = ""
//        //    }
//        
//        return "\(date),\(afterWalletAmount)," +
//            "\(beforeWalletAmount),\(cost)," +
//        "\(destinationMobileNumber),\(destinationName),\(sourceName ?? ""),\(transactionAmount),\(transactionType!.name)\n"
//    }
//    
//    static func csvTitle() -> String{
//        return "Date, Wallet new amount, Wallet prevoius amount, Cost, Destination mobile number, Destination name, Source name, Transaction amount, Transaction type\n"
//    }
//}
//
//class TransactionTypeMO : NSManagedObject {
//    @NSManaged var id : NSNumber
//    @NSManaged var name : String
//    
//    enum TransactionType : NSNumber {
//        case select = 0
//        case topup = 1
//        case send = 2
//        case exchange = 3
//        case cashOut = 4
//        case buy = 5
//    }
//    
//    var type : TransactionType {
//        get {
//            return TransactionType.init(rawValue: id)!
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
//
//class BankAccountMO : NSManagedObject {
//    @NSManaged var bankNameId : NSNumber?
//    @NSManaged var cardNumber : String?
//    @NSManaged var iban : String?
//    @NSManaged var id : NSNumber?
//    @NSManaged var state : NSNumber?
//    @NSManaged var type : NSNumber?
//    @NSManaged var currency : CurrencyMO?
//}
//
//class MerchantMO : NSManagedObject {
//    @NSManaged var id : String!
//    @NSManaged var mDescription : String?
//    @NSManaged var serviceTypeId : NSNumber?
//    @NSManaged var title : String?
//    @NSManaged var websiteAddress : String?
//}

