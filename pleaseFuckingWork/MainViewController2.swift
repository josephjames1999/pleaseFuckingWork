import UIKit
import MapKit
import Firebase
import UserNotifications


class MainViewController2: UIViewController{

    @IBOutlet var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    var lastVisited: CustomAnnotation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.userTrackingMode = .follow
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in
        })
        
        
        
        //        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //          AppManager.shared.logout()
        //        }
        
        loadLocations()
        
    }
    
    
    func loadLocations() {
        
        let ref = Firestore.firestore().collection("locaions")
        ref.getDocuments { snapshot, error in
            guard let snapshot = snapshot else { return }
            for document in snapshot.documents {
                let annotation = CustomAnnotation(document: document)
                self.mapView.addAnnotation(annotation)
            }
        }
        
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
    
    
    func testDistanceToPoints(from location: CLLocation) {
        for annotation in mapView.annotations {
            if let annotation = annotation as? CustomAnnotation {
                let distance = location.distance(from: annotation.location)
                if distance < 250 && annotation != lastVisited {
                    lastVisited = annotation
                    sendNotification()
                }
            }
        }
    }
    
    func sendNotification() {
   
    }
    
    
}

extension MainViewController2: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        testDistanceToPoints(from: location)
        
    }

}

