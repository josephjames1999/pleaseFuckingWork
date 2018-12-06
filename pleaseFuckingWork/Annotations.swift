import Foundation
import MapKit

class CustomAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    init(coordinate: CLLocationCoordinate2D, title: String)
        self.coordinate = coordinate
        self.title = title
    
        let someCooordinate = CLLocationCoordinate2D(latitude: latitude,: 000, longitude: longitude:000)
        let someAnnotation = CustomAnnotation(coordinate: someCooordinate, title: "")
        
        
    
}
}
