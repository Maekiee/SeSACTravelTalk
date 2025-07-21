import UIKit
import SnapKit

class NetfilxViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "PARKFLIX"
        label.textColor = .red
        label.font = .systemFont(ofSize: 28, weight: .heavy)
        return label
    }()
    
    private let placeholders: [String] = ["이메일 주소 또는 전화번호","비밀번호","닉네임","위치","추천 코드 입력"]
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .fill
        placeholders.forEach { item in
            let textField = UITextField()
            textField.attributedPlaceholder = NSAttributedString(
                string: item,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
            )
            textField.backgroundColor = .gray
            textField.textColor = .white
            textField.layer.cornerRadius = 8
            
            textField.snp.makeConstraints { make in
                make.height.equalTo(44)
            }
            stack.addArrangedSubview(textField)
        }
        return stack
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.title = "회원가입"
        config.baseBackgroundColor = .white
        config.baseForegroundColor = .black
        button.configuration = config
        return button
    }()
    
    private let addMoreInfoButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        config.title = "추가정보 입력"
        config.baseForegroundColor = .gray
        button.configuration = config
        return button
    }()
    
    private let moreInfoSwitch: UISwitch = {
        let switchUI = UISwitch()
        switchUI.onTintColor = .red
        return switchUI
    }()

    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .black
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalTo(view.center)
        }
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(100)
            make.horizontalEdges.equalTo(view).inset(20)
        }
        
        view.addSubview(registerButton)
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view).inset(20)
            make.height.equalTo(52)
        }
        
        view.addSubview(addMoreInfoButton)
        addMoreInfoButton.snp.makeConstraints { make in
            make.top.equalTo(registerButton.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(14)
            make.width.equalTo(120)
            make.height.equalTo(44)
        }
        
        view.addSubview(moreInfoSwitch)
        moreInfoSwitch.snp.makeConstraints { make in
            make.top.equalTo(registerButton.snp.bottom).offset(10)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
        
        
    }
    
}
