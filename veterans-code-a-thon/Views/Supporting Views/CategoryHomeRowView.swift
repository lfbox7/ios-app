//
//  CategoryHomeRowView.swift
//  veterans-code-a-thon
//
//  Created by Leonard Box on 5/22/21.
//

import SwiftUI

struct CategoryHomeRowView: View {
    var categoryName: String
    
    var body: some View {
        VStack(alignment: .center) {
            NavigationLink(
                destination: BusinessListView(),
                label: {
                    Text(self.categoryName)
                        .font(.title)
            })
        }
    }
}
