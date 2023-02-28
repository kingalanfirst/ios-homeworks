
import UIKit

class OneMoreCustomHeader: UITableViewHeaderFooterView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 12, y: 12, width: 300, height: 24)
        label.text = "Hot news"
        label.font = UIFont.systemFont (ofSize: 24, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
//        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray4
        contentView.addSubview(titleLabel)
//        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
