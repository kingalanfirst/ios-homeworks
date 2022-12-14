//
//  FeedViewController.swift
//  Navigation
//
//  Created by Alan on 12.12.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "Мой пост")

    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 12
        button.setTitle("Перейти на пост", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
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
        let postViewController = PostViewController()
        postViewController.titlePost = post.title
        navigationController?.pushViewController(postViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        buttonAction()
        view.backgroundColor = .systemBlue
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
