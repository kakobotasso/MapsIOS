//
//  TheaterAnnotation.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 11/03/17.
//  Copyright © 2017 EricBrito. All rights reserved.
//

import Foundation
import MapKit

class TheaterAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
    
    func getAnnotationView() -> MKAnnotationView {
        let annotationView = MKAnnotationView(annotation: self, reuseIdentifier: "Theater")
        annotationView.canShowCallout = true
        annotationView.image = UIImage(named: "theaterIcon")
        return annotationView
    }
}
