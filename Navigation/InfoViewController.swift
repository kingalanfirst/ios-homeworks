//
//  InfoViewController.swift
//  Navigation
//
//  Created by Alan on 13.12.2022.
//

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

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        setupButton()

        // Do any additional setup after loading the view.
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
        let alertController = UIAlertController(title: "Ваша ставка", message: "All in", preferredStyle: .alert)
        let seconndAlertAction = UIAlertAction(title: "На красное", style: .cancel)
        let firstAlertAction = UIAlertAction(title: "На черное", style: .default)
        alertController.addAction(firstAlertAction)
        alertController.addAction(seconndAlertAction)
        present(alertController, animated: true, completion: nil)
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

