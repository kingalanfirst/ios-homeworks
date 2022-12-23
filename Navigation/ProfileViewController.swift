
import UIKit

class ProfileViewController: UIViewController {
    
    var profileHeaderView = ProfileHeaderView()
    
    private lazy var newButton: UIButton = {
        let newButton = UIButton()
        newButton.backgroundColor = .systemBlue
        newButton.layer.cornerRadius = 4
        newButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        newButton.layer.shadowOpacity = 0.7
        newButton.layer.shadowRadius = 4
        newButton.layer.shadowColor = UIColor.black.cgColor
        newButton.setTitle("New button", for: .normal)
        newButton.setTitleColor(.white, for: .normal)
        newButton.titleLabel?.font = newButton.titleLabel?.font.withSize(14)
        newButton.translatesAutoresizingMaskIntoConstraints = false
        return newButton
    }()

    private func setConstraints() {
        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(greaterThanOrEqualToConstant: 220), // что-то маловато 220
            
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            newButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            newButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileHeaderView)
        view.addSubview(newButton)
        setConstraints()
    }
}
