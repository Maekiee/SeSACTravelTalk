import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var chatTableView: UITableView!
    
    let chatRoomList: [ChatRoom] = ChatList.list
    
    var list: [ChatRoom] = [] {
        didSet {
            chatTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        chatTableView.rowHeight = 80
        list = chatRoomList
    }
    
    private func configureView() {
        chatTableView.dataSource = self
        chatTableView.dataSource = self
        searchBar.delegate = self
        let xib = UINib(nibName: CellStorage.chatIdentifier, bundle: nil)
        chatTableView.register(xib, forCellReuseIdentifier: CellStorage.chatIdentifier)
        searchBar.searchBarStyle = .minimal
    }
    
    
    // 입력할 때마다 호출
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchingValue = searchBar.text else { return }
        searchingChatRoom(searchingValue)
    }
    
    // 엔터시 호출
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchingValue = searchBar.text else { return }
        searchingChatRoom(searchingValue)
    }
    
    func searchingChatRoom(_ searchWord: String) {
        let filerList = list.filter { item in
            guard let lastMessge = item.chatList.last?.message else { return false }
            guard let userName = item.chatList.last?.user.name else { return false }
            return lastMessge.contains(searchWord) || userName.contains(searchWord) || item.chatroomName.contains(searchWord)
        }
        
        list = filerList.isEmpty ?  chatRoomList : filerList
    }
    
    
    // MARK: - 테이블 뷰 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatTableView.dequeueReusableCell(withIdentifier: CellStorage.chatIdentifier, for: indexPath) as! ChatTableViewCell

        cell.configureData(row: list[indexPath.row])
        
        return cell
    }
}
