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

    }
    
    private func configureView() {
        searchBar.delegate = self
        chatTableView.dataSource = self
        chatTableView.delegate = self
        
        list = chatRoomList
        chatTableView.rowHeight = 80
        
        let xib = UINib(nibName: CellIdentifiers.chatIdentifier, bundle: nil)
        chatTableView.register(xib, forCellReuseIdentifier: CellIdentifiers.chatIdentifier)
        searchBar.searchBarStyle = .minimal
        
    }
    
    
    //MARK: - 검색
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
        let cell = chatTableView.dequeueReusableCell(withIdentifier: CellIdentifiers.chatIdentifier, for: indexPath) as! ChatTableViewCell

        cell.configureData(row: list[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: CellIdentifiers.chatRoomIndentifier) as! ChatRoomViewController
        
        vc.chatRoomText = list[indexPath.row].chatroomName
        vc.chatList = list[indexPath.row].chatList
        
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
