

import UIKit

class ChatRoomViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    @IBOutlet var chatRoomTableView: UITableView!
    @IBOutlet var chatTextField: UITextField!
    
    
    var chatRoomText = ""
    var chatList: [Chat] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        /// view did appear 에서 하면 조금 느림
        DispatchQueue.main.async {
            self.scrollToBottom()
        }
        
    }
    
    private func configTableView() {
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
    
    private func scrollToBottom() {
        let lastIndex = chatList.count - 1
        let indexPath = IndexPath(row: lastIndex, section: 0)
        
        chatRoomTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
    
    
    // MARK: - tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chatItem = chatList[indexPath.row]
        
        if chatItem.user.name == ChatList.me.name {
            let myChatCell = chatRoomTableView.dequeueReusableCell(withIdentifier: CellIdentifiers.myChatIdentifier, for: indexPath) as! MyChatTableViewCell
            
            myChatCell.configureCellData(row: chatItem)
            
            
            return myChatCell
        } else {
            let partnerCell = chatRoomTableView.dequeueReusableCell(withIdentifier: CellIdentifiers.partnerCellIdentifier, for: indexPath) as! PartnerChatTableViewCell
    
            partnerCell.configureCellData(row: chatItem)
            
            return partnerCell
        }
    }
    
    
    //MARK: -UI 액션
    @IBAction func navBarColseTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
        
    }
    
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
