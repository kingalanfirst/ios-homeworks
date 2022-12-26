
import UIKit

class PostViewController: UIViewController {
    var titlePost: String = "Anonymous"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .lightGray
        navigationItem.title = titlePost
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(barButtonAction))
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc private func barButtonAction() {
        let vc = InfoViewController()
        present(vc, animated: true, completion: nil)
    }
}
