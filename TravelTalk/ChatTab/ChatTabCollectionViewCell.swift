import UIKit

class ChatTabCollectionViewCell: UICollectionViewCell {

    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var lastMessageTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }

    
    private func configureView() {
        profileImage.setCircleImage()
        
        userNameLabel.textColor = .black
        userNameLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        
        messageLabel.textColor = .gray
        messageLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        lastMessageTimeLabel.textColor = .gray
        lastMessageTimeLabel.font = .systemFont(ofSize: 12, weight: .regular)
    }
    
    func configureData(row: ChatRoom) {
        profileImage.image = row.setChatRoomImage
        userNameLabel.text = row.chatroomName
        messageLabel.text = row.chatList.last?.message
        lastMessageTimeLabel.text = row.chatList.last?.formatDate
    }
}
