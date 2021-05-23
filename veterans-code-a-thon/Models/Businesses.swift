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
    var address: String
}

func businessDictionaryFrom(business: Business) -> [String : Any] {
    return NSDictionary(objects: [business.id,
                                  business.businessType,
                                  business.image,
                                  business.name,
                                  business.address
                        ],
                        forKeys: [kID as NSCopying,
                                  kBUSINESSTYPE as NSCopying,
                                  kBUSINESSIMAGE as NSCopying,
                                  kBUSINESSNAME as NSCopying,
                                  kBUSINESSADDRESS as NSCopying
                                  
                        ]) as! [String : Any]
}
