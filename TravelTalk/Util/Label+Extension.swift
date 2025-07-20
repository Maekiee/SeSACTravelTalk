import UIKit

extension UILabel {
    
    func setChatLabelStyle() {
        self.numberOfLines = 0
        self.font = .systemFont(ofSize: 16)
    }
    
    func setChatTimeLabel() {
        self.font = .systemFont(ofSize: 12)
        self.textColor = .gray
    }

}
