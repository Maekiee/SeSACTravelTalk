
import UIKit

class PartnerChatTableViewCell: UITableViewCell {
    
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var chatTimeLabel: UILabel!
    @IBOutlet var chatContainer: UIView!
    @IBOutlet var chatContentLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        profileImage.setCircleImage()

        userNameLabel.textColor = .black
        
        chatContainer.setChatBubbleStyle(isMyChat: false)
        chatContentLabel.setChatLabelStyle()
        chatTimeLabel.setChatTimeLabel()
    }
    
    
}
