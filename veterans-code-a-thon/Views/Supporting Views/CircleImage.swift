//
//  EditParkView.swift
//  SAParkFinder
//
//  Created by Leonard Box on 4/18/20.
//  Copyright © 2020 Leonard Box. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CircleImage: View {
    var business: Business

    var body: some View {
        WebImage(url: URL(string: business.image))
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .shadow(radius: 10)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
        
    }
}
