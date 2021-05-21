//
//  FirebaseReference.swift
//  veterans-code-a-thon
//
//  Created by Leonard Box on 5/21/21.
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
