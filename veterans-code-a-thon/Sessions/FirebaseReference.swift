//
//  FirebaseReference.swift
//  veterans-code-a-thon
//
//  Created by Leonard Box on 5/22/21.
//  Copyright © 2021 Leonard Box. All rights reserved.
//

import Firebase
import FirebaseFirestore

enum FirebaseCollectionReference: String {
    case Users
    case Businesses
}

func FirebaseReference (_ collectionReference: FirebaseCollectionReference) -> CollectionReference {
    
    return Firestore.firestore().collection(collectionReference.rawValue)
}
