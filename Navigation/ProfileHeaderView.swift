
import UIKit

class ProfileHeaderView: UIView {
    
    var frames = CGRectZero
    
    private lazy var profileImageView: UIImageView = {
        let profileImageView = UIImageView()
        profileImageView.image = UIImage(named: "gorilla.png")
        profileImageView.frame = CGRect(x: 16, y: 16, width: 150, height: 150)
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderWidth = 3
        profileImageView.layer.borderColor = UIColor.white.cgColor
        return profileImageView
    }()
    
    private lazy var profileNameLabel: UILabel = {
        let profileNameLabel = UILabel()
        profileNameLabel.text = "@KillaGorilla"
        profileNameLabel.font = profileNameLabel.font.withSize(18)
        profileNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        profileNameLabel.textColor = .black
        profileNameLabel.frame = CGRect(x: 100, y: 27, width: 300, height: 30)
        profileNameLabel.textAlignment = .center
        return profileNameLabel
    }()
    
    private lazy var profileStatusLabel: UILabel = {
        let profileStatusLabel = UILabel()
        profileStatusLabel.numberOfLines = 0
        //        profileStatusLabel.lineBreakMode = .byWordWrapping
        profileStatusLabel.text = "Looking for a big, young, good looking, able to cook female gorilla"
        profileStatusLabel.textColor = .gray
        profileStatusLabel.font = profileNameLabel.font.withSize(14)
        profileStatusLabel.frame = CGRect(x: 180, y: 100, width: UIScreen.main.bounds.width - 198, height: 30)
        profileStatusLabel.textAlignment = .center
        profileStatusLabel.sizeToFit()
        return profileStatusLabel
        
    }()
    private lazy var showStatusButton: UIButton = {
        let showStatusButton = UIButton()
        showStatusButton.backgroundColor = .systemBlue
        showStatusButton.layer.cornerRadius = 4
        showStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatusButton.layer.shadowOpacity = 0.7
        showStatusButton.layer.shadowRadius = 4
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.setTitle("Show status", for: .normal)
        showStatusButton.setTitleColor(.white, for: .normal)
        showStatusButton.titleLabel?.font = showStatusButton.titleLabel?.font.withSize(14)
        showStatusButton.frame = CGRect(x: 16, y: profileImageView.frame.height + 32,
                                        width: UIScreen.main.bounds.width - 32, height: 50)
        showStatusButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return showStatusButton
    }()
    
    private func setupView() {
        addSubview(profileImageView)
        addSubview(profileNameLabel)
        addSubview(profileStatusLabel)
        addSubview(showStatusButton)
    }
    
    @objc private func buttonAction() {
        guard let statusText = profileStatusLabel.text else {
            print("\(profileNameLabel.text!) has no status")
            return
        }
        print(statusText)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
