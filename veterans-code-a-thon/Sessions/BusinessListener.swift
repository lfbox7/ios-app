//
//  BusinessListener.swift
//  veterans-code-a-thon
//
//  Created by Leonard Box on 5/22/21.
//  Copyright © 2021 Leonard Box. All rights reserved.
//

import Foundation
import Firebase

class BusinessListener: ObservableObject {
    @Published var showFeaturedOnly = false
    @Published var businesses: [Business] = []
    
    init() {
        downloadBusinesses()
    }
    
    func downloadBusinesses() {
        FirebaseReference(.Businesses).getDocuments { (snapshot, error) in
            guard let snapshot = snapshot else { return }
            if !snapshot.isEmpty {
                self.businesses = BusinessListener.businessFromDictionary(snapshot)
            }
        }
    }
    
    static func businessFromDictionary(_ snapshot: QuerySnapshot) -> [Business] {
        var allBusinesses: [Business] = []
        
        for snapshot in snapshot.documents {
            let businessData = snapshot.data()
            allBusinesses.append(Business(id: businessData[kID] as? String ?? UUID().uuidString,
                                          businessType: Category(rawValue: businessData[kBUSINESSTYPE] as? String ?? "Other Services") ?? .otherServices,
                                          image: businessData[kBUSINESSIMAGE] as? String ?? "Unknown",
                                          name:businessData[kBUSINESSNAME] as? String ?? "Unknown",
                                          address1:businessData[kBUSINESSADDRESS1] as? String ?? "Unknown",
                                          address2:businessData[kBUSINESSADDRESS2] as? String ?? "",
                                          city:businessData[kBUSINESSCITY] as? String ?? "Unknown",
                                          disabled:businessData[kBUSINESSDISABLED] as? Bool ?? false,
                                          email:businessData[kBUSINESSEMAIL] as? String ?? "Unknown",
                                          established:businessData[kBUSINESSESTABLISHED] as? Int ?? 1900,
                                          expiration:businessData[kBUSINESSEXPIRATION] as? String ?? "Unknown",
                                          fax:businessData[kBUSINESSFAX] as? String ?? "Unknown",
                                          minority:businessData[kBUSINESSMINORITY] as? Bool ?? false,
                                          phone:businessData[kBUSINESSPHONE] as? String ?? "Unknown",
                                          state:businessData[kBUSINESSSTATE] as? String ?? "Unknown",
                                          url:businessData[kBUSINESSURL] as? String ?? "Unknown",
                                          verified:businessData[kBUSINESSVERIFIED] as? String ?? "Unknown",
                                          women:businessData[kBUSINESSWOMEN] as? Bool ?? false
                                          
            ))
        }
        return allBusinesses
    }
}
