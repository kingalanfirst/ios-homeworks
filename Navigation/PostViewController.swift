//
//  PostViewController.swift
//  Navigation
//
//  Created by Alan on 12.12.2022.
//

import UIKit

class PostViewController: UIViewController {
    var titlePost: String = "Anonymous"

    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

        // Do any additional setup after loading the view.
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

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
