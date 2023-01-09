
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
    
//    private func setupConstraints() {
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            contentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            contentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            contentView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
//            contentView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
//            contentView.topAnchor.constraint(equalTo: contentView.topAnchor),
//        ])
//    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
