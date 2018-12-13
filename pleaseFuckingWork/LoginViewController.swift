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
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let user = result?.user {
                self.setupUserRef(user: user)
            }
        }
    }
    
    func setupUserRef(user: User) {
        
        let data = [
            "score": 0
        ]
        
        let ref = Firestore.firestore().collection("users").document(user.uid)
        ref.setData(data) { error in
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    
}
