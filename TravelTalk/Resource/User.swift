import UIKit

struct User {
    let name: String //유저 닉네임
    let image: String // 유저 이미지
    
    var setImage: UIImage {
        return UIImage(named: image)!
    }
}
