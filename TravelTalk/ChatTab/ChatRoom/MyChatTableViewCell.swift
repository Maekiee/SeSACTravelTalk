
import UIKit

class MyChatTableViewCell: UITableViewCell {

    @IBOutlet var chatContainer: UIView!
    @IBOutlet var chatLabel: UILabel!
    @IBOutlet var chatTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configFixedStyle()
    }
    
    func configFixedStyle() {
        chatContainer.backgroundColor = .black
    }
    
}
