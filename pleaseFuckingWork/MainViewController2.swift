import UIKit
import MapKit
import CoreLocation

class MainViewController2: UIViewController{
    
    @IBOutlet var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.userTrackingMode = .follow
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        
        //        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //          AppManager.shared.logout()
        //        }
        
        
    }
}
extension MainViewController2: MKMapViewDelegate{
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            
        }
        
        return view
        
        
    }
    
}

