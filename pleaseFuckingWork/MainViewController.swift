import UIKit
import MapKit

class MainViewController: UIViewController{
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
      super.viewDidLoad()

//        mapView.userTrackingMode = .follow
//
//        locationManager.requestAlwaysAuthorization()
//        locationManager.delegate = self
//        locationManager.startUpdatingLocation()
//
//        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//          AppManager.shared.logout()
//        }
//
//    }
//
   // extension ViewController: MKMapViewDelegate{

//        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//
//            //guard let annotation = annotation as? Treasure else { return nil }
//
//            let identifier = "marker"
//            var view: MKMarkerAnnotationView
//
//            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
//                as? MKMarkerAnnotationView {
//                dequeuedView.annotation = annotation
//                view = dequeuedView
//            } else {
//                view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//
//            }
//
//            return view
//
//
//        }
    
    }

}
