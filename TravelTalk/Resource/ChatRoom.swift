import UIKit

//트래블톡 화면에서 사용할 데이터 구조체
struct ChatRoom {
    //채팅방 고유 ID
    let chatroomId: Int
    //채팅방 이미지
    let chatroomImage: String
    //채팅방 이름
    let chatroomName: String
    var chatList: [Chat] = []
    
    var setChatRoomImage: UIImage {
        return UIImage(named: chatroomImage)!
    }
    
}
