
import UIKit

class PostTableViewCell: UITableViewCell {
    
    static let cellID = "cellId"
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = String()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage()
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = String()
        label.font = UIFont.systemFont (ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var likesCountLabel: UILabel = {
        let label = UILabel()
        label.text = String()
        label.font = UIFont.systemFont (ofSize: 16, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var viewsCountLabel: UILabel = {
        let label = UILabel()
        label.text = String()
        label.font = UIFont.systemFont (ofSize: 16, weight: .regular)
        label.textColor = .black
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(newsImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(likesCountLabel)
        contentView.addSubview(viewsCountLabel)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            newsImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            newsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            newsImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            newsImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),

            descriptionLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            likesCountLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesCountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesCountLabel.trailingAnchor.constraint(equalTo: contentView.centerXAnchor),

            viewsCountLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsCountLabel.leadingAnchor.constraint(equalTo: contentView.centerXAnchor),
            viewsCountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            contentView.bottomAnchor.constraint(equalTo: likesCountLabel.bottomAnchor, constant: 16)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = UITableViewCell.SelectionStyle.none
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
