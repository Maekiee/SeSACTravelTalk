import UIKit

class ChatTableViewCell: UITableViewCell {
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    private func configureView() {
        profileImage.layer.cornerRadius = frame.width / 2
        profileImage.clipsToBounds = true
        profileImage.backgroundColor = .lightGray
    
    }

    
}
