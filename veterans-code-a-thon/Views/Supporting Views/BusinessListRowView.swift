//
//  BusinessListRowView.swift
//  veterans-code-a-thon
//
//  Created by Leonard Box on 5/22/21.
//  Copyright © 2021 Leonard Box. All rights reserved.
//

import SwiftUI
import MapKit
import SDWebImageSwiftUI

struct BusinessListRowView: View {
    var business: Business
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: business.image))
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .cornerRadius(10)
                .shadow(radius: 10)
            Text(business.name)
            Spacer()
        }
    }
}
