import UIKit
import Firebase

class LoginViewController: UIViewController{
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordViewController: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.text = "test@test.com"
        passwordViewController.text = "password"
    }
    
    @IBAction func login(_ sender: Any) {
        
        guard let email = emailTextField.text, let password = passwordViewController.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) {user, error in
            if let _ = user{
                self.dismiss(animated: true, completion: nil)
                
            }
        }
    }
}
