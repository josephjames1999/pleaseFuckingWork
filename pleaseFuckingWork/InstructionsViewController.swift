import UIKit

class InstructionViewController: UIViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: "FirstLaunch")
        AppManager.shared.dismiss()
    }
    
}
