
import UIKit

class PartnerChatTableViewCell: UITableViewCell {
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var userNmaeLabel: UILabel!
    @IBOutlet var chatContainer: UIView!
    @IBOutlet var chatContentLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configFixedCellStyle()
    }
    
    func configFixedCellStyle() {
        chatContainer.backgroundColor = .systemGreen
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
