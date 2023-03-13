
import UIKit

protocol ProfileHeaderViewDelegate: AnyObject {
    func profileHeaderViewDidTap(_ profileHeaderView: ProfileHeaderView)
}

class ProfileHeaderView: UIView {
    weak var delegate: ProfileHeaderViewDelegate?
    
    private lazy var profileStatusLabelConstraint: NSLayoutConstraint = {
        var constraint = NSLayoutConstraint()
        constraint = profileStatusLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 49)
        return constraint
    }()
            
    lazy var profileImageView: UIImageView = {
        let profileImageView = UIImageView()
        profileImageView.image = UIImage(named: "gorilla.png")
        profileImageView.frame = CGRect(x: 16, y: 16, width: 150, height: 150)
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderWidth = 3
        profileImageView.layer.borderColor = UIColor.white.cgColor
//        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        return profileImageView
    }()
        
    private lazy var profileNameLabel: UILabel = {
        let profileNameLabel = UILabel()
        profileNameLabel.text = "@KillaGorilla"
        profileNameLabel.font = profileNameLabel.font.withSize(18)
        profileNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        profileNameLabel.textColor = .black
        profileNameLabel.textAlignment = .left
        profileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return profileNameLabel
    }()
    
    lazy var profileStatusLabel: UILabel = {
        let profileStatusLabel = UILabel()
        profileStatusLabel.numberOfLines = 0
        profileStatusLabel.text = "Looking for a big, young, good looking, able to cook female gorilla"
        profileStatusLabel.textColor = .gray
        profileStatusLabel.font = profileNameLabel.font.withSize(14)
        profileStatusLabel.textAlignment = .left
        profileStatusLabel.sizeToFit()
        profileStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        return profileStatusLabel
    }()
    
    lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.backgroundColor = .white
        statusTextField.placeholder = "Text your status"
        statusTextField.layer.cornerRadius = 12
        statusTextField.font = statusTextField.font?.withSize(15)
        statusTextField.textColor = .black
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.addTarget(self, action: #selector(statusTextFieldChanged), for: .editingChanged)
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        let paddingView = UIView(frame: CGRectMake(0, 0, 8, statusTextField.frame.height))
        statusTextField.leftView = paddingView
        statusTextField.leftViewMode = UITextField.ViewMode.always
        return statusTextField
    }()

    private lazy var setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.setTitle("Set status", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.titleLabel?.font = setStatusButton.titleLabel?.font.withSize(14)
        setStatusButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        return setStatusButton
    }()
        
    private lazy var statusText: String = {
        return statusText
    }()
            
    private func setupView() {
        addSubview(profileImageView)
        addSubview(profileNameLabel)
        addSubview(profileStatusLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            profileNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            profileNameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20),
            profileNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            profileNameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 30),
            
            profileStatusLabel.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor, constant: 10),
            profileStatusLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20),
            profileStatusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            profileStatusLabelConstraint,
            
            statusTextField.topAnchor.constraint(equalTo: profileStatusLabel.bottomAnchor, constant: 10),
            statusTextField.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            bottomAnchor.constraint(equalTo: setStatusButton.bottomAnchor, constant: 16),
        ])
    }
        
    @objc private func statusTextFieldChanged(_ textField: UITextField) {
        statusText = statusTextField.text!
    }
    
    // MARK: - diploma work
    private func emptyFieldAnimation1(for textField: UITextField) {
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       options: .autoreverse,
                       animations: {
            textField.placeholder = "Error. Empty text field"
            textField.backgroundColor = UIColor.red.withAlphaComponent(0.3)
        }, completion: nil)
    }
    //

    @objc private func buttonAction() {
        // MARK: - diploma work
        guard statusTextField.text?.count != 0 else {
            return emptyFieldAnimation1(for: statusTextField)
        }
        statusTextField.backgroundColor = .white
        statusTextField.placeholder = "Text your status"
        delegate?.profileHeaderViewDidTap(self)
        //
        profileStatusLabel.text = statusText        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray4
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
