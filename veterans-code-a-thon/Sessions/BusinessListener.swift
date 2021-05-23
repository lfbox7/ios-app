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
                                          address:businessData[kBUSINESSADDRESS] as? String ?? "Unknown"
                                          
            ))
        }
        return allBusinesses
    }
}
