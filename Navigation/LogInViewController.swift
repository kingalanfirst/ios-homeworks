
import UIKit

class LogInViewController: UIViewController {
    
    private lazy var topConstraint: NSLayoutConstraint = {
        var constraint = NSLayoutConstraint()
        constraint = shortPasswordLable.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 0)
        return constraint
    }()
    
    private lazy var heightConstraint: NSLayoutConstraint = {
        var constraint = NSLayoutConstraint()
        constraint = shortPasswordLable.heightAnchor.constraint(equalToConstant: 0)
        return constraint
    }()

    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo.png")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var userIDTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.placeholder = "Email or phone"
        textField.textColor = .black
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.tintColor = UIColor.darkGray
        textField.autocapitalizationType = .none
        textField.addTarget(self, action: #selector(resignFirstResponder), for: .touchDown)
        textField.translatesAutoresizingMaskIntoConstraints = false
        let paddingView = UIView(frame: CGRectMake(0, 0, 10, textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = UITextField.ViewMode.always
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.isSecureTextEntry = true
        textField.placeholder = "Password"
        textField.textColor = .black
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.tintColor = UIColor.darkGray
        textField.autocapitalizationType = .none
        textField.addTarget(self, action: #selector(resignFirstResponder), for: .touchDown)
        textField.translatesAutoresizingMaskIntoConstraints = false
        let paddingView = UIView(frame: CGRectMake(0, 0, 10, textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = UITextField.ViewMode.always
        return textField
    }()
    
    // MARK: - diploma work
    private lazy var shortPasswordLable: UILabel = {
        let lable = UILabel()
        lable.backgroundColor = .white
        lable.font = UIFont.systemFont(ofSize: 16)
        lable.text = "Password must be at least 8 characters"
        lable.textColor = .red
        lable.textAlignment = .center
        lable.isHidden = true
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    //

    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "VKColor")
        button.layer.cornerRadius = 10
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    // MARK: - diploma work
    private func emptyFieldAnimation(for textField: UITextField) {
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       options: .autoreverse,
                       animations: {
            textField.backgroundColor = UIColor.red.withAlphaComponent(0.3)
        }, completion: nil)
    }
    
    @objc private func buttonAction() {
        if passwordTextField.text!.count < 8 && passwordTextField.text!.count > 0 {
            makeAppearShortPasswordLable()
        } else if passwordTextField.text!.count >= 8 {
            if usersArray.contains(where: {$0.login.isEmpty == false && $0.password.isEmpty == false}) {
//            if usersArray.contains(where: {$0.login == userIDTextField.text && $0.password == passwordTextField.text}) {
                let profileViewController = ProfileViewController()
                navigationController?.pushViewController(profileViewController, animated: true)
            } else {
                let alertController = UIAlertController(title: "Login Failed", message: "Your email or password is incorrect. Please try again", preferredStyle: .alert)
                let okAlertAction = UIAlertAction(title: "OK", style: .default, handler: {(alert: UIAlertAction!) in })
                alertController.addAction(okAlertAction)
                present(alertController, animated: true, completion: nil)
                cancelAnimation()
            }
        }
        guard userIDTextField.text?.count != 0 else {
            return emptyFieldAnimation(for: userIDTextField)
        }
        userIDTextField.backgroundColor = .systemGray6

        guard passwordTextField.text?.count != 0 else {
            return emptyFieldAnimation(for: passwordTextField)
        }
        passwordTextField.backgroundColor = .systemGray6
    }
    //
    
    private func setupScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
    }
    
    private func setupContentView(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(logoImageView)
        contentView.addSubview(userIDTextField)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(shortPasswordLable)
        contentView.addSubview(logInButton)
        scrollView.addSubview(contentView)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: view.heightAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),

            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            userIDTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            userIDTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            userIDTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            userIDTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: userIDTextField.bottomAnchor, constant: -0.5),
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            // MARK: - diploma work
            topConstraint,
            shortPasswordLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            shortPasswordLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            heightConstraint,
            //
            
            logInButton.topAnchor.constraint(equalTo: shortPasswordLable.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    // MARK: - diploma work
    private func cancelAnimation() {
        shortPasswordLable.isHidden = true
        topConstraint.constant = 0
        heightConstraint.constant = 0
        
        userIDTextField.backgroundColor = .systemGray6
        passwordTextField.backgroundColor = .systemGray6
    }
    
    private func makeAppearShortPasswordLable() {
        contentView.layoutIfNeeded()
        shortPasswordLable.isHidden = false
        topConstraint.constant = 16
        heightConstraint.constant = 20

        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       options: .curveEaseIn,
                       animations: {
            self.contentView.layoutIfNeeded()
        }, completion: nil)
    }
    //

    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_ :)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        let keyboardFrameSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let x = keyboardFrameSize.height - (scrollView.frame.maxY - logInButton.frame.maxY)
        scrollView.contentOffset = CGPoint(x: 0, y: x)
    }
    
    @objc func keyboardWillHide() {
        scrollView.contentOffset = CGPoint.zero
    }

    @objc private func hideKeyboard() {
        view.endEditing(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        setupScrollView()
        setupContentView()
        setupConstraints()
        registerForKeyboardNotifications()
    }
    
    // MARK: - diploma work
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        cancelAnimation()
    }
    //
    
    deinit {
        removeKeyboardNotifications()
    }
}
