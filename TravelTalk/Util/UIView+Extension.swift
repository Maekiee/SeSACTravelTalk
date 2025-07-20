import UIKit


extension UIView {
    func setChatBubbleStyle(isMyChat isMyText: Bool) {
        self.backgroundColor = isMyText ? .systemGray5 : .systemGray6
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemGray.cgColor
    }
}

