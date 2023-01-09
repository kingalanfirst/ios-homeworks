
import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    static let cellID = "cellId2"

    let tableViewCellPhotos = photos.prefix(20)
        
//    private enum LayoutConstant {
//        static let spacing8: CGFloat = 8.0
//        static let spacing12: CGFloat = 12.0
//    }
    
    let collectionViewLayout = UICollectionViewFlowLayout()

    lazy var photosCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
    
    func setupCollectionView() {
        collectionViewLayout.scrollDirection = .horizontal
        photosCollectionView.backgroundColor = .clear
        photosCollectionView.showsHorizontalScrollIndicator = false
        photosCollectionView.register(TableCollectionViewCell.self, forCellWithReuseIdentifier: TableCollectionViewCell.identifier)
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
        photosCollectionView.translatesAutoresizingMaskIntoConstraints = false
    }
        
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.font = UIFont.systemFont (ofSize: 24, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var forwardImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        let config = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular)
        imageView.image = UIImage(systemName: "arrow.forward", withConfiguration: config)
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    func setupViews() {
//        photosCollectionView.addSubview(photoImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(forwardImageView)
        contentView.addSubview(photosCollectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.centerXAnchor),

            forwardImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            forwardImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            forwardImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            
            photosCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            photosCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photosCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photosCollectionView.heightAnchor.constraint(equalToConstant: 110.25),
            photosCollectionView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            photosCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        selectionStyle = UITableViewCell.SelectionStyle.none
        setupViews()
        setupCollectionView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - Collection View Data Source

extension PhotosTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tableViewCellPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableCollectionViewCell.identifier, for: indexPath) as! TableCollectionViewCell

        let photo = tableViewCellPhotos[indexPath.row]
        cell.photoImageView.image = UIImage(named: photo.imageName)
        cell.contentView.backgroundColor = .clear
        return cell
    }
}

// MARK: - Collection View Delegate Flow Layout

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let width = (screenWidth - 48) / 4
        return CGSize(width: width, height: width)
    }
    
    //    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
    //        let itemsInRow: CGFloat = 4
    //        let totalSpacing: CGFloat = (itemsInRow + 1) * spacing
    //        let finalWidth = (width - totalSpacing) / itemsInRow
    //        return finalWidth
    //    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //        return 8
    //    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

