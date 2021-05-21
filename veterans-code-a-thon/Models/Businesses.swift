//
//  Businesses.swift
//  veterans-code-a-thon
//
//  Created by Leonard Box on 5/21/21.
//

import SwiftUI
import Firebase
import Foundation

enum Category: String, CaseIterable, Codable, Hashable {
    case aerospaceAndDefense
    case agricultureAndForestry
    case artsAndEntertainment
    case automotive
    case businessServices
    case commercialContracting
    case construction
    case educationAndTraining
    case employmentServices
    case energyAndUtilities
    case engineeringServices
    case environmentalServices
    case financialServices
    case foodAndDrink
    case government
    case healthMedicalAndDental
    case insuranceServices
    case internetServices
    case legalServices
    case lodgingAndTravel
    case manufacturing
    case marketingAndSales
    case miscellaneous
    case nonprofitAndFreeHelp
    case publishingAndPrinting
    case realEstateServices
    case residentialServices
    case securityAndSafety
    case storesAndDealers
    case technology
    case transportationServices
}

struct Business: Identifiable, Hashable {
    var id: String
    var businessType: Category
}

func businessDictionaryFrom(business: Business) -> [String : Any] {
    return NSDictionary(objects: [business.id,
                                  business.businessType
                        ],
                        forKeys: [kID as NSCopying,
                                  kBUSINESSTYPE as NSCopying
                        ]) as! [String : Any]
}
