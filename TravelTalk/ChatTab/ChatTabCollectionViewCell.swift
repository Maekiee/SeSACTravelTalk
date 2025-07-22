import UIKit

class ChatTabCollectionViewCell: UICollectionViewCell, ConfigurationCellProtocol {
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var lastMessageTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.setCircleImage()
        
        userNameLabel.textColor = .black
        userNameLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        
        messageLabel.textColor = .gray
        messageLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        lastMessageTimeLabel.textColor = .gray
        lastMessageTimeLabel.font = .systemFont(ofSize: 12, weight: .regular)
    }
    
    func configureData(row: Any) {
        let chatRoom = row as! ChatRoom
        profileImage.image = chatRoom.setChatRoomImage
        userNameLabel.text = chatRoom.chatroomName
        messageLabel.text = chatRoom.chatList.last?.message
        lastMessageTimeLabel.text = chatRoom.chatList.last?.formatDate
    }
}
