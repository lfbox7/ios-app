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
    
    //var coordinate: CLLocationCoordinate2D {
        //CLLocationCoordinate2D(
            //latitude: park.latitude,
            //longitude: park.longitude)
    //}
    
    var body: some View {
        VStack {
            MapDetailView(coordinate: coordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
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
                            Text(business.address)
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
                    NavigationLink(destination: DirectionsView(coordinate: coordinate, name: business.name)) {
                        Text("Get Directions")
                            
                            .foregroundColor(.blue)
                        
                        
                    }
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
                            Text(self.park.description)
                                .frame(width: geometry.size.width)
                        }
                    }
                }
                List {
                    HStack {
                        Text("Amenities:")
                            .bold()
                            .underline()
                    }
                    Section {
                        VStack {
                            HStack {
                                if(park.hasRestrooms == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Restrooms")
                                Spacer()
                                if(park.hasWater == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Water")
                            }
                            HStack {
                                if(park.hasCommunityCenter == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Community Center")
                                Spacer()
                                if(park.hasPavilion == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Pavilion")
                            }
                            HStack {
                                if(park.hasTables == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Tables")
                                Spacer()
                                if(park.hasGrill == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Grill")
                            }
                            HStack {
                                if(park.hasBikeRack == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Bike Rack")
                                Spacer()
                                if(park.hasBikeRepair == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Repair Station")
                            }
                            HStack {
                                if(park.hasPlayground == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Playground")
                                Spacer()
                                if(park.hasDogPark == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Dog Park")
                            }
                        }
                    }
                    Section {
                        VStack {
                            HStack {
                                if(park.hasTrail == true) {
                                    Image(systemName: "checkmark.square")
                                    Text(" Trail:    Surface: \(park.trailSurface)     Length: \(park.trailLength, specifier: "%.2f")")
                                } else {
                                    Image(systemName: "square")
                                    Text(" Trail")
                                }
                            }
                        }
                    }
                    Section {
                        VStack {
                            HStack {
                                if(park.hasBaseball == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Baseball")
                                Spacer()
                                if(park.hasBasketball == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Basketball")
                            }
                            HStack {
                                if(park.hasBikePark == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Bike Park")
                                Spacer()
                                if(park.hasDiscGolf == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Disc Golf")
                            }
                            HStack {
                                if(park.hasFitness == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Fitness Equipment")
                                Spacer()
                                if(park.hasHandball == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Handball")
                            }
                            HStack {
                                if(park.hasMultiPurpose == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Multi-Purpose Field")
                                Spacer()
                                if(park.hasPickleball == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Pickleball")
                            }
                            HStack {
                                if(park.hasPool == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Pool")
                                Spacer()
                                if(park.hasSkatePark == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Skate Park")
                            }
                            HStack {
                                if(park.hasSoccer == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Soccer")
                                Spacer()
                                if(park.hasSoftball == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Softball")
                            }
                            HStack {
                                if(park.hasTennis == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Tennis")
                                Spacer()
                                if(park.hasVolleyball == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Volleyball")
                            }
                        }
                    }
                }
            }
            .padding()
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
    }
}
}
