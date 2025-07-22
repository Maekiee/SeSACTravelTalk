import UIKit
import SnapKit

class GameViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "UP DOWN"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
//            make.horizontalEdges.equalToSuperview(view.center)
        }

    }
    
    
    
}
