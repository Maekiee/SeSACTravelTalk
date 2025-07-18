import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var chatTableView: UITableView!
    
    let chatRoomList: [ChatRoom] = ChatList.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        chatTableView.rowHeight = 100

    }
    
    private func configureView() {
        chatTableView.dataSource = self
        chatTableView.dataSource = self
        let xib = UINib(nibName: CellStorage.chatIdentifier, bundle: nil)
        chatTableView.register(xib, forCellReuseIdentifier: CellStorage.chatIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatRoomList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatTableView.dequeueReusableCell(withIdentifier: CellStorage.chatIdentifier, for: indexPath) as! ChatTableViewCell
        
        cell.configureData(row: chatRoomList[indexPath.row])
        
        return cell
    }
}
