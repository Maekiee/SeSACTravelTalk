
import UIKit

class PartnerChatTableViewCell: UITableViewCell, ConfigurationCellProtocol {
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
    
    func configureData(row: Any) {
        let chat = row as! Chat
        profileImage.image = chat.user.setImage
        userNameLabel.text = chat.user.name
        chatContentLabel.text = chat.message
        chatTimeLabel.text = chat.chatRoomFormatDate
    }
}
