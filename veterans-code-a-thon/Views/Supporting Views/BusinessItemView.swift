//
//  ParkItemView.swift
//  SAParkFinder
//
//  Created by Leonard Box on 4/18/20.
//  Copyright © 2020 Leonard Box. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct BusinessItemView: View {
    var business: Business
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            WebImage(url: URL(string: business.image))
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 170)
                .cornerRadius(10)
                .shadow(radius: 10)
            VStack(alignment: .leading, spacing: 5) {
                Text(business.name)
                    .foregroundColor(.primary)
                    .font(.headline)
                Text(business.address)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
        }
    }
}
