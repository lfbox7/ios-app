//
//  Businesses.swift
//  veterans-code-a-thon
//
//  Created by Leonard Box on 5/21/21.
//  Copyright © 2021 Leonard Box. All rights reserved.
//

import SwiftUI
import Firebase
import Foundation

enum Category: String, CaseIterable, Codable, Hashable {
    case agricultureForestryFishingAndHunting
    case mining
    case utilities
    case construction
    case manufacturing
    case wholesaleTrade
    case retailTrade
    case transportationAndWarehousing
    case information
    case financeAndInsurance
    case realEstateRentalAndLeasing
    case professionalScientificAndTechnicalServices
    case managementOfCompaniesAndEnterprises
    case AdministrativeAndSupportAndWasteManagementAndRemediationServices
    case EducationalServices
    case HealthCareAndSocialAssistance
    case artsEntertainmentAndRecreation
    case accommodationAndFoodServices
    case otherServices
    case publicAdministration
}

struct Business: Identifiable, Hashable {
    var id: String
    var businessType: Category
    var image: String
    var name: String
    var address1: String
    var address2: String
    var city: String
    var disabled: Bool
    var email: String
    var established: Int
    var expiration: String
    var fax: String
    var minority: Bool
    var phone: String
    var state: String
    var url: String
    var verified: String
    var women: Bool

}

func businessDictionaryFrom(business: Business) -> [String : Any] {
    return NSDictionary(objects: [business.id,
                                  business.businessType,
                                  business.image,
                                  business.name,
                                  business.address1,
                                  business.address2,
                                  business.city,
                                  business.disabled,
                                  business.email,
                                  business.established,
                                  business.expiration,
                                  business.fax,
                                  business.minority,
                                  business.phone,
                                  business.url,
                                  business.women
                                  
                        ],
                        forKeys: [kID as NSCopying,
                                  kBUSINESSTYPE as NSCopying,
                                  kBUSINESSIMAGE as NSCopying,
                                  kBUSINESSNAME as NSCopying,
                                  kBUSINESSADDRESS1 as NSCopying,
                                  kBUSINESSADDRESS2 as NSCopying,
                                  kBUSINESSCITY as NSCopying,
                                  kBUSINESSDISABLED as NSCopying,
                                  kBUSINESSEMAIL as NSCopying,
                                  kBUSINESSESTABLISHED as NSCopying,
                                  kBUSINESSEXPIRATION as NSCopying,
                                  kBUSINESSFAX as NSCopying,
                                  kBUSINESSMINORITY as NSCopying,
                                  kBUSINESSPHONE as NSCopying,
                                  kBUSINESSSTATE as NSCopying,
                                  kBUSINESSURL as NSCopying,
                                  kBUSINESSVERIFIED as NSCopying,
                                  kBUSINESSWOMEN as NSCopying
                                  
                                  
                        ]) as! [String : Any]
}
