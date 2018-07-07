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
    var originName: String? {get set}
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
    //var country : CountryP? {get set}
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
    var amount : Double {get set}
//    var middleCurrency : CurrencyP? {get set}
    var changedWallet : WalletP? {get set}
    var beforeWalletAmount : Double {get set}
    var afterWalletAmount : Double {get set}
    var sourceName : String? {get set}
    var currency : CurrencyP? {get set}
    var destinationMobileNumber : String? {get set}
    var destinationName : String? {get set}
//    var destinationCurrency: CurrencyP? {get set}
    var bankAccount : BankAccountP? {get set}
    var exchangeRate : Double {get set}
    var merchant : MerchantP? {get set}
    var tags : [TagP]? {get set}
    var payer: PayerP? {get set}
    var fees: [FeeP]? {get set}
    var sender : P2PInfoP? {get set}
    var receiver : P2PInfoP? {get set}
    var subTransaction: TransactionP? {get set}
    var mainTransaction: TransactionP? {get set}
    var amountInUserCurrency: AmountInUserCurrencyP? {get set}
    var state: TransactionStateP? {get set}
    var net: Double {get set}
    var referenceId : Int64 {get set}
    var reservation: ReservationP? {get set}
    var touristCardTransaction: TouristCardTransactionP? {get set}
    var viewType : String? { get set }
}

@objc public protocol P2PInfoP {
    var name : String? {get set}
    var mobileNumber : String? { get set}
    var imageAddress : String? {get set}
    var image : UIImage? {get set}
}

@objc public protocol TouristCardTransactionP {
    var id : Int {get set}
    var terminalType : String? {get set}
    var rrn : String? {get set}
    var touristCard : TouristCardP? {get set}
}

@objc public protocol AmountInUserCurrencyP {
    var exchangeRate : ExchangeModelP? {get set}
    var action : String? {get set}
    var isApproximate : Bool { get set}
    
    func string(amount: Double) -> String?
}

@objc public protocol BankAccountP : DataP {
    var type : BankAccountTypeP? {get set}
    var cardNumber : String? {get set}
    var IBAN : String? {get set}
    var state : String? {get set}
    var stateE: InfoState {get set}
//    var bankName : BankNameP? {get set}
    var id : Int {get set}
    var currency : CurrencyP? {get set}
    var swiftCode : SwiftCodeP? {get set}
//    var institutionNumber: String? {get set}
    var branchFullAddress: String? {get set}
    var beneficiary: String? {get set}
//    var branchNumber: String? {get set}
}

@objc public protocol BankNameP {
    var title : String? {get set}
    var id : Int {get set}
}

@objc public protocol SwiftCodeP {
    var code : String? {get set}
    var address: AddressP? {get set}
    var bankName: String? {get set}
}

@objc public protocol ReservationP {
    var id : Int {get set}
    var state: InfoState {get set}
    var amount: Double {get set}
    var cancellationFee: Double {get set}
    var date: Date? {get set}
    var failureInfo : FailureInfoP? {get set}
    var merchant : MerchantP? {get set}
    var currency : CurrencyP? {get set}
}

@objc public protocol FailureInfoP {
    var title : String? {get set}
    var description : String? { get set}
}

@objc public protocol IbanP {
    var iban : String? {get set}
    var accountNumber: String? {get set}
    var swiftCode: SwiftCodeP? {get set}
}

@objc public enum BankAccountStateE : Int {
    case inProgress = 0
    case approved = 1
    case rejected = 2
}

//@objc public protocol BankAccountStateP {
//    var title : String? {get}
//    var state : InfoState {get set}
//}

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
    var logo : UIImage? {get set}
    var logoAddress : String? {get set}
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
//    case none = 0
    case topup = 1
    case transfer = 2
//    case exchange = 3
    case bankTransfer = 4
    case purchase = 5
    case touristCardRecharge = 6
    case touristCardDebit = 7
    case touristCardConsume = 8
//    case reverse = 9
    case reservation = 10
//    case inboundTransfer = 11
    case cashTopup = 12
    case initialTopup = 13
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
//    var id : Int {get set}
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
    var refreshToken : String? {get set}
}

@objc public protocol ExchangeModelP : DataP {
    var currentCurrency : CurrencyP? {get set}
    var destinationCurrency : CurrencyP? {get set}
    var rate : Double {get set}
    var transactionFee : Float {get set}
    var lastUpdateTime : Date? {get set}
    func string(reversed: Bool) -> String 
}

@objc public enum InfoState : Int {
    case verified
    case checking
    case rejected
}

public struct InfoStateString {
    public static let checking = "InProgress"
    public static let verified = "Approved"
    public static let rejected = "Rejected"
    
    public static func getState(title: String) -> InfoState{
        switch title {
        case checking:
            return .checking
        case verified:
            return .verified
        case rejected:
            return .rejected
        case "Failed":
            return .rejected
        default:
            return .checking
        }
    }
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

@objc public protocol TouristCardP: DataP {
    var pan: String? {get set}
    var expirationDate: Date? {get set}
//    var requested: Bool {get set}
    var stateE : InfoState {get set}
//    var deliveryAddress: AddressP? {get set}
    var simorghCardState : String? {get set}
}

@objc public protocol TouristCardRequestP {
    var createTime: Date? {get set}
    var lastUpdateTime: Date? {get set}
    var userStatus : String? {get set}
    var infoState : InfoState {get set}
    var failure: FailureInfoP? {get set}
    var touristCard: TouristCardP? {get set}
    var delivery: DeliveryP? {get set}
}

@objc public protocol DeliveryP {
    var address : AddressP? {get set}
    var freightNumber : String? {get set}
    var deliveryState : String? {get set}
}

@objc public protocol InstructionP {
    var title : String? {get set}
    var description : String? {get set}
}

@objc public protocol AppVersionP {
    var latestVersion : String? {get set}
    var latestVersionCode : String? {get set}
    var url : String? {get set}
    var releaseNotes : String? {get set}
    var forceUpdate : Bool {get set}
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
    var currency: CurrencyP? {get set}
    var amounts: [Double]? {get set}
}

@objc public protocol FaqP : DataP {
    var type: String? {get set}
    var answer: String? {get set}
    var question: String? {get set}
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
    //var state: InfoState {get set}
    var gender : GenderE {get set}
    var birthdate : Date? {get set}
    
}

@objc public protocol AddressP: DataP {
    var province: String? {get set}
    var city: String? {get set}
    var postalCode: String? {get set}
    var address: String? {get set}
    var country: CountryP? {get set}
//    var addressDescription: String? {get set}
    var lat: String? {get set}
    var long: String? {get set}
    var addressDetail: String? {get set}
}

@objc public protocol VerificationStateP: DataP {
    var mobileNumberConfirmed: Bool {get set}
    var emailConfirmed: Bool {get set}
    var passportStatus: InfoState {get set}
    var profileImageStatus: InfoState {get set}
    var addressConfirmed: Bool {get set}
}
