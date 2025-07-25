import UIKit

class ChatRoomViewController: UIViewController, ViewControllerConfigurationProtocol {
    @IBOutlet var chatRoomTableView: UITableView!
    @IBOutlet var chatTextField: UITextField!
    
    var chatRoomText = ""
    var chatList: [Chat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
        DispatchQueue.main.async {
            self.scrollToBottom()
        }
    }
    
    func configureView() {
        title = chatRoomText
        navigationItem.leftBarButtonItem?.tintColor = .black
        chatRoomTableView.separatorStyle = .none
        
        let xib = UINib(nibName: CellIdentifiers.myChatIdentifier, bundle: nil)
        chatRoomTableView.register(xib, forCellReuseIdentifier: CellIdentifiers.myChatIdentifier)
        
        let xib2 = UINib(nibName: CellIdentifiers.partnerCellIdentifier, bundle: nil)
        chatRoomTableView.register(xib2, forCellReuseIdentifier: CellIdentifiers.partnerCellIdentifier)
        
        chatRoomTableView.rowHeight = UITableView.automaticDimension
        chatRoomTableView.delegate = self
        chatRoomTableView.dataSource = self
        chatTextField.delegate = self
        
        chatTextField.placeholder = "메세지를 입력하세요"
    }
    
    // 스크롤 바텀
    private func scrollToBottom() {
        let lastIndex = chatList.count - 1
        let indexPath = IndexPath(row: lastIndex, section: 0)
        
        chatRoomTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
       
    //MARK: -UI 액션
    @IBAction func navBarColseTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
        
    }
    
    
}


//MARK: 테이블 뷰 메서드
extension ChatRoomViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chatItem = chatList[indexPath.row]
        
        if chatItem.user.name == ChatList.me.name {
            let myChatCell = chatRoomTableView.dequeueReusableCell(withIdentifier: CellIdentifiers.myChatIdentifier, for: indexPath) as! MyChatTableViewCell
            
            myChatCell.configureData(row: chatItem)
            
            
            return myChatCell
        } else {
            let partnerCell = chatRoomTableView.dequeueReusableCell(withIdentifier: CellIdentifiers.partnerCellIdentifier, for: indexPath) as! PartnerChatTableViewCell
    
            partnerCell.configureData(row: chatItem)
            
            return partnerCell
        }
    }
}


//MARK: 텍스트 필드 델리게이트
extension ChatRoomViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let newMessage = textField.text else { return false }
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let stringDate = formatter.string(from: date)
        
        let post = Chat(
            user: User(name: "김새싹", image: "Me"),
            date: stringDate,
            message: newMessage
        )
        chatList.append(post)
        chatTextField.text = ""
        chatRoomTableView.reloadData()
        scrollToBottom()
        return false
    }
}
