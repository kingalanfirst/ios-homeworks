
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
        contentView.addSubview(profileHeaderView)
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: profileHeaderView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: profileHeaderView.heightAnchor),
            contentView.topAnchor.constraint(equalTo: profileHeaderView.topAnchor),
        ])
    }
}
