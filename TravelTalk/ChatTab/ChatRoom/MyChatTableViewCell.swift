
import UIKit

class MyChatTableViewCell: UITableViewCell {

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
    
    
}
