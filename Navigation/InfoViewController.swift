
import UIKit

class InfoViewController: UIViewController {

    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 12
        button.setTitle("Push me", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        setupButton()
    }
    
    private func setupButton() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func buttonAction() {
        let alertController = UIAlertController(title: "Choose the pill", message: "Mr. Anderson", preferredStyle: .alert)
        let seconndAlertAction = UIAlertAction(title: "Red one", style: .cancel, handler: {(alert: UIAlertAction!) in print("Reality")})
        let firstAlertAction = UIAlertAction(title: "Blue one", style: .default, handler: {(alert: UIAlertAction!) in print("Matrix")})
        alertController.addAction(firstAlertAction)
        alertController.addAction(seconndAlertAction)
        present(alertController, animated: true, completion: nil)
    }
}

