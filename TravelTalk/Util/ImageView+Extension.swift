import UIKit


extension UIImageView {
    
    func setCircleImage() {
        self.layer.cornerRadius = self.frame.width / 2
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
        self.backgroundColor = .lightGray
    }
}
