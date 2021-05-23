//
//  BusinessItemView.swift
//  veterans-code-a-thon
//
//  Created by Leonard Box on 5/21/21.
//  Copyright © 2021 Leonard Box. All rights reserved.
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
                Text(business.address1)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
                Text(business.address2)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
        }
    }
}
