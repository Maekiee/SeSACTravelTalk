import Foundation

//채팅 화면에서 사용할 데이터 구조체
struct Chat {
    static let dateformatter = DateFormatter()
    
    let user: User
    let date: String
    let message: String
    
    var formatDate: String {
        Chat.dateformatter.dateFormat = "yyyy-MM-dd HH:mm"
        if let stringToDate = Chat.dateformatter.date(from: date) {
            Chat.dateformatter.dateFormat = "yy.MM.dd"
            let lastDate = Chat.dateformatter.string(from: stringToDate)
            return lastDate
        } else {
            return date
        }
    }
    
    var chatRoomFormatDate: String {
        Chat.dateformatter.dateFormat = "yyyy-MM-dd HH:mm"
        if let stringToDate = Chat.dateformatter.date(from: date) {
            Chat.dateformatter.dateFormat = "hh:mm a"
            Chat.dateformatter.locale = Locale(identifier: "ko_KR")
            let lastDate = Chat.dateformatter.string(from: stringToDate)
            return lastDate
        } else {
            return date
        }
    }
}
