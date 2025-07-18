import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var chatTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()

    }
    
    private func configureView() {
        chatTableView.dataSource = self
        chatTableView.dataSource = self
        
        let xib = UINib(nibName: CellStorage.chatIdentifier, bundle: nil)
        chatTableView.register(xib, forCellReuseIdentifier: CellStorage.chatIdentifier)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatTableView.dequeueReusableCell(withIdentifier: CellStorage.chatIdentifier, for: indexPath) as! ChatTableViewCell
        
        return cell
    }
}
