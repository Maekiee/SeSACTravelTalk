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
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .fill
        [textfield1, textfield2, textfield3, textfield4, textfield5].forEach { item in
            stack.addArrangedSubview(item)
        }
        return stack
    }()
    
    private let textfield1: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "이메일 주소 또는 전화번호",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        textField.backgroundColor = .gray
        textField.textColor = .white
        textField.layer.cornerRadius = 8
        return textField
    }()
    
    private let textfield2: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .gray
        textField.attributedPlaceholder = NSAttributedString(
            string: "비밀번호",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        textField.textColor = .white
        textField.layer.cornerRadius = 8
        return textField
    }()
    
    private let textfield3: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .gray
        textField.attributedPlaceholder = NSAttributedString(
            string: "닉네임",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        textField.textColor = .white
        textField.layer.cornerRadius = 8
        return textField
    }()
    
    private let textfield4: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .gray
        textField.attributedPlaceholder = NSAttributedString(
            string: "워치",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        textField.textColor = .white
        textField.layer.cornerRadius = 8
        return textField
    }()
    
    private let textfield5: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .gray
        textField.attributedPlaceholder = NSAttributedString(
            string: "추천 코드 입력",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        textField.textColor = .white
        textField.layer.cornerRadius = 8
        return textField
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
        
        textfield1.snp.makeConstraints { make in
            make.height.equalTo(44)
        }
        textfield2.snp.makeConstraints { make in
            make.height.equalTo(44)
        }
        textfield3.snp.makeConstraints { make in
            make.height.equalTo(44)
        }
        textfield4.snp.makeConstraints { make in
            make.height.equalTo(44)
        }
        textfield5.snp.makeConstraints { make in
            make.height.equalTo(44)
        }
        
        view.addSubview(registerButton)
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(textfield5.snp.bottom).offset(20)
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
