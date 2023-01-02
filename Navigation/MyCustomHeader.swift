//
//  MyCustomHeader.swift
//  Navigation
//
//  Created by Alan on 02.01.2023.
//

import UIKit

class MyCustomHeader: UITableViewHeaderFooterView {

    var profileHeaderView = ProfileHeaderView()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureContents() {
        contentView.backgroundColor = .cyan
        contentView.addSubview(profileHeaderView)
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileHeaderView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            profileHeaderView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: contentView.topAnchor),
        ])
    }
}
