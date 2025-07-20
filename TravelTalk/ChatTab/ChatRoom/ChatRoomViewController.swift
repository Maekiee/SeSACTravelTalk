

import UIKit

class ChatRoomViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var chatRoomTableView: UITableView!
    var chatRoomText = ""
    var chatList: [Chat] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configTableView()
        
    }
    
    
    func configTableView() {
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
    
    
    @IBAction func navBarColseTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
        
    }
    

}
