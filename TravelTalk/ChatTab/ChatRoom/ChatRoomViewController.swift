

import UIKit

class ChatRoomViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var chatRoomTableView: UITableView!
    var chatRoonText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configTableView()
        
    }
    
    
    func configTableView() {
        title = chatRoonText
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
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myChatCell = chatRoomTableView.dequeueReusableCell(withIdentifier: CellIdentifiers.myChatIdentifier, for: indexPath) as! MyChatTableViewCell
        
        let partnerCell = chatRoomTableView.dequeueReusableCell(withIdentifier: CellIdentifiers.partnerCellIdentifier, for: indexPath) as! PartnerChatTableViewCell
        
        return partnerCell
    }
    
    
    @IBAction func navBarColseTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
        
    }
    

}
