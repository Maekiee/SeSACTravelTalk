
import UIKit

class MyChatTableViewCell: UITableViewCell, ConfigurationCellProtocol {
    @IBOutlet var chatContainer: UIView!
    @IBOutlet var chatLabel: UILabel!
    @IBOutlet var chatTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        chatContainer.setChatBubbleStyle(isMyChat: true)
        chatLabel.setChatLabelStyle()
        chatTimeLabel.setChatTimeLabel()
    }
    
    func configureData(row: Any) {
        let chat = row as! Chat
        chatLabel.text = chat.message
        chatTimeLabel.text = chat.chatRoomFormatDate
    }
}
