
import UIKit

class TableCollectionViewCell: UICollectionViewCell {
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage()
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private func setupViews() {
        contentView.addSubview(photoImageView)
    }

    private func setupConstraints() {

        NSLayoutConstraint.activate([
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TableCollectionViewCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
