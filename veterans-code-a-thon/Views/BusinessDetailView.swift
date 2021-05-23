//
//  BusinessDetailView.swift
//  veterans-code-a-thon
//
//  Created by Leonard Box on 5/23/21.
//

import SwiftUI
import CoreLocation
import SDWebImageSwiftUI

struct BusinessDetailView: View {
    var business: Business
    /*
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: park.latitude,
            longitude: park.longitude)
    }
    */
    var body: some View {
        VStack {
            //MapDetailView(coordinate: coordinate)
                //.edgesIgnoringSafeArea(.top)
                //.frame(height: 300)
            CircleImage(business: business)
                .offset(x: 0, y: -150)
                .padding(.bottom, -150)
            VStack(alignment: .leading) {
                Text(business.name)
                    .font(.title)
                    .bold()
                    .padding(.bottom)
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(business.address1)
                                .font(.subheadline)
                            Text(business.address2)
                                .font(.subheadline)
                        }
                        HStack {
                            Text("\(business.city), \(business.state)")
                                .font(.subheadline)
                        }
                    
                }
                .padding(.bottom)
                HStack {
                    Spacer()
                    //NavigationLink(destination: DirectionsView(coordinate: coordinate, name: business.name)) {
                    //    Text("Get Directions")
                            
                    //        .foregroundColor(.blue)
                    //}
                    Spacer()
                }
                .padding(.bottom)
                HStack {
                    Text("Categories:")
                        .bold()
                        .underline()
                }
                HStack {
                    GeometryReader { geometry in
                        ScrollView {
                            Text(verbatim: self.business.businessType.rawValue)
                                .frame(width: geometry.size.width)
                        }
                    }
                }
                List {
                    HStack {
                        Text("Business Information:")
                            .bold()
                            .underline()
                    }
                    Section {
                        VStack {
                            HStack {
                                if(business.disabled == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Disabled Veteran Owned")
                                Spacer()
                                if(business.minority == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Minority Veteran Owned")
                            }
                            HStack {
                                if(business.women == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Woman Veteran Owned")
                                Spacer()
                                //
                            }
                          
                        }
                    }
                }
                .padding()
                }
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
    }
}
