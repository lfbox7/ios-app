//
//  DirectionsView.swift
//  veterans-code-a-thon
//
//  Created by Leonard Box on 5/22/21.
//  Copyright © 2021 Leonard Box. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation

struct DirectionsMapView: View {
    var coordinate: CLLocationCoordinate2D
    var name: String
    
    var body: some View {
        DirectionsView(coordinate: coordinate, name: name)
        .edgesIgnoringSafeArea(.all)
    }
}

struct DirectionsMapView_Previews: PreviewProvider {
    static var previews: some View {
        DirectionsMapView(coordinate: CLLocationCoordinate2D(latitude:  29.549316, longitude: -98.764715), name: "Government Canyon State Natural Area")
    }
}

struct DirectionsView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D
    var name: String
    @ObservedObject var locationViewModel = LocationViewModel()

    func makeUIView(context: UIViewRepresentableContext<DirectionsView>) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.userTrackingMode = .follow
        let status = CLLocationManager.authorizationStatus()
        print("Got here!")
        
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            let homeCoordinate = CLLocationCoordinate2D(latitude: locationViewModel.currentLatitude, longitude: locationViewModel.currentLongitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            let region = MKCoordinateRegion(center: homeCoordinate, span: span)
            map.setRegion(region, animated: true)
        
            let destinationCoordinate = coordinate
            print("Current location: \(homeCoordinate)")
            print("Park location: \(destinationCoordinate)")
            
            let destinationPin = MKPointAnnotation()
            destinationPin.coordinate = destinationCoordinate
            destinationPin.title = name
            map.addAnnotation(destinationPin)
            
            map.delegate = context.coordinator
            
            let req = MKDirections.Request()
            req.source = MKMapItem(placemark: MKPlacemark(coordinate: homeCoordinate))
            req.destination = MKMapItem(placemark: MKPlacemark(coordinate: destinationCoordinate))
            
            let directions = MKDirections(request: req)
            directions.calculate { (direct, error) in
                guard let direct = direct else { return }
                
                let route = direct.routes[0]
                map.addOverlay(route.polyline, level: .aboveRoads)
                
                let rect = route.polyline.boundingMapRect
                map.setRegion(MKCoordinateRegion(rect), animated: true)
            }
        }
        return map
    }
    
    func updateUIView(_ view: MKMapView, context: UIViewRepresentableContext<DirectionsView>) {
    }
    
    func makeCoordinator() -> Coordinator {
        return DirectionsView.Coordinator()
    }
    
    class Coordinator : NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let render = MKPolylineRenderer(overlay: overlay)
            render.strokeColor = .blue
            render.lineWidth = 4
            return render
        }
    }
}
