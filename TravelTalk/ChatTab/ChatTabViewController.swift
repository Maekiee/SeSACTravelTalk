import UIKit

class ChatTabViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    @IBOutlet var chatTabCollectionView: UICollectionView!
    @IBOutlet var searchBar: UISearchBar! {
        didSet {
            //
        }
    }
    
    private let chatRoomList: [ChatRoom] = ChatList.list
    private var list: [ChatRoom] = [] {
        didSet {
            chatTabCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        title = "TRAVEL TALK"
        searchBar.delegate = self
        chatTabCollectionView.dataSource = self
        chatTabCollectionView.delegate = self
        
        list = chatRoomList
        
        let xib = UINib(nibName: CellIdentifiers.chatTabCellIdentifier, bundle: nil)
        chatTabCollectionView.register(xib, forCellWithReuseIdentifier: CellIdentifiers.chatTabCellIdentifier)
        searchBar.searchBarStyle = .minimal
        
        chatTabCollectionView.collectionViewLayout = createLayout()
        
        
    }
    
    // ****
    func createLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let deviceWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: deviceWidth, height: 80)
        layout.sectionInset = UIEdgeInsets(top: 16, left: 20, bottom: 16, right: 20)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .vertical
        return layout
    }
    
    //MARK: 검색
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
    
    private func searchingChatRoom(_ searchWord: String) {
        let filerList = list.filter { item in
            guard let lastMessge = item.chatList.last?.message else { return false }
            guard let userName = item.chatList.last?.user.name else { return false }
            return lastMessge.contains(searchWord) || userName.contains(searchWord) || item.chatroomName.contains(searchWord)
        }
        
        list = filerList.isEmpty ?  chatRoomList : filerList
    }
    
    
    //MARK: 컬렉션뷰 메서드
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = chatTabCollectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.chatTabCellIdentifier, for: indexPath) as! ChatTabCollectionViewCell
        
        cell.configureData(row: list[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: CellIdentifiers.chatRoomIndentifier) as! ChatRoomViewController
        
        vc.chatRoomText = list[indexPath.row].chatroomName
        vc.chatList = list[indexPath.row].chatList
        
        
        navigationController?.pushViewController(vc, animated: true)
    }



}
