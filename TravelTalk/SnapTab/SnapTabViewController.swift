import UIKit

class SnapTabViewController: UIViewController {
    @IBOutlet var goNetfilxButton: UIButton!
    @IBOutlet var goNaverButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        goNetfilxButton.addTarget(self, action: #selector(goNetfilxScreen), for: .touchUpInside)
        goNaverButton.addTarget(self, action: #selector(goNaverScreen), for: .touchUpInside)
    }
    
    @objc func goNetfilxScreen() {
        let vc = NetfilxViewController()
        present(vc, animated: true)
        
    }
    @objc func goNaverScreen() {
        let vc = NaverViewController()
        present(vc, animated: true)
    }
    
}
