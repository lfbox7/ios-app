//
//  BusinessListView.swift
//  veterans-code-a-thon
//
//  Created by Leonard Box on 5/22/21.
//  Copyright © 2021 Leonard Box. All rights reserved.
//

import SwiftUI

struct BusinessListView: View {
    @ObservedObject private var businessListener = BusinessListener()
    
    var body: some View {
        List {
            ForEach(businessListener.businesses) { business in
                NavigationLink(
                    destination: BusinessDetailView(business: business)
                        .environmentObject(self.businessListener)
                ) {
                    BusinessListRowView(business: business)
                }
            }
            .navigationBarTitle(Text("Businesses"), displayMode: .inline)
        }
    }
}
