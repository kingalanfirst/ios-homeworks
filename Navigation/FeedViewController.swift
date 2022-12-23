//
//  FeedViewController.swift
//  Navigation
//
//  Created by Alan on 12.12.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "My post")
    
    private lazy var verticalStackView: UIStackView = {
        var verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .center
        verticalStackView.distribution = .fillEqually
        verticalStackView.spacing = 10
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.addArrangedSubview(button1)
        verticalStackView.addArrangedSubview(button2)
        return verticalStackView
    }()

    private lazy var button1: UIButton = {
        let button1 = UIButton()
        button1.backgroundColor = .white
        button1.layer.cornerRadius = 12
        button1.setTitle("Read post", for: .normal)
        button1.setTitleColor(.black, for: .normal)
        button1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button1.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button1.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button1.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button1
    }()
    
    private lazy var button2: UIButton = {
        let button2 = UIButton()
        button2.backgroundColor = .white
        button2.layer.cornerRadius = 12
        button2.setTitle("Read post", for: .normal)
        button2.setTitleColor(.black, for: .normal)
        button2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button2.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button2.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button2
    }()
    
    private func setupVerticalStackView() {
        view.addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    @objc private func buttonAction() {
        let postViewController = PostViewController()
        postViewController.titlePost = post.title
        navigationController?.pushViewController(postViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVerticalStackView()
        view.backgroundColor = .systemBlue
    }    
}
