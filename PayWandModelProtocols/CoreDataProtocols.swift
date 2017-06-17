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
    
    init(coreDataObject : NSManagedObject?)
    
    init(frcResult result : NSFetchRequestResult?)
    
}

@objc public protocol CountryP : DataP {
    
    var name: String? {get set}
    var id: Int {get set}
    var phoneCode: String? {get set}
    var code : String? {get set}
    var currency : CurrencyP? {get set}
}

extension Equatable where Self : CountryP
{
    
}

public func == (lhs: CountryP?, rhs: CountryP?) -> Bool {
    return lhs?.id == rhs?.id
}

@objc public protocol UserP : DataP {
    //var address : String? {get set}
    var birthDate : Date? {get set}
    //var city : String? {get set}
    var email : String? {get set}
    var firstName : String? {get set}
    var lastName : String? {get set}
    var nationalCode : String? {get set}
    var password : String? {get set}
    var phoneNumber : String? {get set}
    var pin : String? {get set}
    //var postalCode : String? {get set}
    var username : String {get set}
    var country : CountryP? {get set}
    var profileImage : UIImage? {get set}
    var phoneVerificationCode : String? {get set}
    var wallets : [WalletP]? {get set}
    var currency : CurrencyP? {get set}
    var token : TokenP? {get set}
    //var province : String? {get set}
    var isPhoneVerified : Bool {get set}
    var isAccountCreated: Bool {get set}
    var addressInfo: AddressP? {get set}
    var verificationState: VerificationStateP? {get set}
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
    var tags : [TagP]? {get set}
    var payer: PayerP? {get set}
    var fees: [FeeP]? {get set}
    var subTransaction: TransactionP? {get set}
    var mainTransaction: TransactionP? {get set}
    var amountInUserCurrency: Double {get set}
    var state: TransactionStateP? {get set}
    var net: Double {get set}
}

@objc public protocol BankAccountP : DataP {
    var type : BankAccountTypeP? {get set}
    var cardNumber : String? {get set}
    var IBAN : String? {get set}
    var state : BankAccountStateP? {get set}
    //var bankNameId : Int {get set}
    var bankName : BankNameP? {get set}
    var id : Int {get set}
    var currency : CurrencyP? {get set}
    var institutionNumber: String? {get set}
    var branchFullAddress: String? {get set}
    var branchNumber: String? {get set}
}

@objc public protocol BankNameP {
    var title : String? {get set}
    var id : Int {get set}
}

@objc public enum BankAccountStateE : Int {
    case inProgress = 0
    case approved = 1
    case rejected = 2
}

@objc public protocol BankAccountStateP {
    var title : String? {get}
//    var id : Int {get set}
    var state : BankAccountStateE {get set}
}

@objc public enum BankAccountTypeE : Int {
    case none = 0
    case card = 1
    case iban = 2
}

@objc public protocol BankAccountTypeP {
    var title : String? { get }
//    var id : Int {get set}
    
    var type : BankAccountTypeE {get set}
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

@objc public protocol TagP : DataP, NSObjectProtocol {
    var title : String? {get set}
}

@objc public enum TransactionTypeE : Int {
    case select = 0
    case topup = 1
    case send = 2
    case exchange = 3
    case cashOut = 4
    case purchase = 5
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

@objc public enum InfoState : Int {
    case verified
    case checking
    case rejected
}

public struct InfoStateString {
    public static let checking = "Pending"
    public static let verified = "Approved"
    public static let rejected = "Failed"
}

@objc public enum DocumentTypeE: Int {
    case none
    case passport
    case visa
    case ticket
    case address
}

@objc public protocol DocumentTypeP: DataP {
    var title: String {get set}
}

@objc public protocol DocumentP: DataP {
    var image: UIImage? {get set}
    var url: String? {get set}
    //var state: String? {get set}
    var type: DocumentTypeP? {get set} //DocumentTypeE {get set}
    var stateE : InfoState {get set}
    var uploaded: Bool {get set}
}

@objc public protocol PayerP: DataP {
    var firstName: String? {get set}
    var lastName: String? {get set}
    var phone: String? {get set}
    var email: String? {get set}
    var address: String? {get set}
    var country: String? {get set}
}

@objc public protocol FeeP: DataP {
    var type: Int {get set}
    var subType: Int {get set}
    var currency: CurrencyP? {get set}
    var amount: Double {get set}
}

@objc public protocol TransactionStateP : DataP, NSObjectProtocol {
    var id : Int {get set}
    var title : String? {get set}
    
    var type : TransactionStateE { get }
}

@objc public enum TransactionStateE : Int {
    case pending = 0
    case approved = 1
    case refunded = 2
    case failed = 3
    case rolledBack = 4
}

@objc public enum GenderE: Int {
    case female = 0
    case male = 1
    case other = 2
}

@objc public protocol PassportP : DataP {
    var issueDate: Date? {get set}
    var expireDate: Date? {get set}
    var fatherName: String? {get set}
    var country: CountryP? {get set}
    var birthplaceCountry : CountryP? {get set}
    var number : String? {get set}
    var state: InfoState {get set}
    var gender : GenderE {get}
    var birthdate : Date? {get set}
    
}

@objc public protocol AddressP: DataP {
    var province: String? {get set}
    var city: String? {get set}
    var postalCode: String? {get set}
    var address: String? {get set}
}

@objc public protocol VerificationStateP: DataP {
    var mobileNumberConfirmed: Bool {get set}
    var emailConfirmed: Bool {get set}
    var passportStatus: InfoState {get set}
    var profileImageStatus: InfoState {get set}
    var addressConfirmed: Bool {get set}
}
