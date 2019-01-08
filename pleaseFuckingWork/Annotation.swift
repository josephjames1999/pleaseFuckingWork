import Foundation
import UIKit
import MapKit
import Firebase

class CustomAnnotation: NSObject, MKAnnotation {
    
    var point: GeoPoint
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: point.latitude, longitude: point.longitude)
    }

    var title: String?
    
    init(document: QueryDocumentSnapshot) {
        self.point = document.data()["coordinate"] as! GeoPoint
        self.title = document.data()["name"] as? String
    }
    
    
}
