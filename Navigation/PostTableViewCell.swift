
import UIKit

class PostTableViewCell: UITableViewCell {
    
    static let cellID = "cellId"
    
    weak var titleLabel: UILabel? = {
        let label = UILabel()
        label.text = String()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    weak var newsImageView: UIImageView? = {
        let imageView = UIImageView()
        imageView.image = UIImage()
        imageView.backgroundColor = .black
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    weak var descriptionLabel: UILabel? = {
        let label = UILabel()
        label.text = String()
        label.font = UIFont.systemFont (ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    weak var likesCountLabel: UILabel? = {
        let label = UILabel()
        label.text = String()
        label.font = UIFont.systemFont (ofSize: 16, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    weak var viewsCountLabel: UILabel? = {
        let label = UILabel()
        label.text = String()
        label.font = UIFont.systemFont (ofSize: 16, weight: .regular)
        label.textColor = .black
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    func setupViews() {
        contentView.addSubview(titleLabel!)
        contentView.addSubview(newsImageView!)
        contentView.addSubview(descriptionLabel!)
        contentView.addSubview(likesCountLabel!)
        contentView.addSubview(viewsCountLabel!)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel!.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            newsImageView!.topAnchor.constraint(equalTo: titleLabel!.bottomAnchor, constant: 16),
            newsImageView!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            newsImageView!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            newsImageView!.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            newsImageView!.widthAnchor.constraint(equalTo: contentView.widthAnchor),

            descriptionLabel!.topAnchor.constraint(equalTo: newsImageView!.bottomAnchor, constant: 16),
            descriptionLabel!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            likesCountLabel!.topAnchor.constraint(equalTo: descriptionLabel!.bottomAnchor, constant: 16),
            likesCountLabel!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesCountLabel!.trailingAnchor.constraint(equalTo: contentView.centerXAnchor),

            viewsCountLabel!.topAnchor.constraint(equalTo: descriptionLabel!.bottomAnchor, constant: 16),
            viewsCountLabel!.leadingAnchor.constraint(equalTo: contentView.centerXAnchor),
            viewsCountLabel!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
//    label.text = "\(post.author). \(post.title)"

//    private func addPostViewsToArray() -> [UIView] {
//        let postView: UIView = UIView()
//        var postViewsArray: [UIView] = []
//
//        for post in postArray {
//            postView.addSubview(titleLabel)
//            postView.addSubview(newsImageView)
//            postView.addSubview(textLabel)
//            postView.addSubview(likesCountLabel)
//            postView.addSubview(viewsCountLabel)
//            postViewsArray.append(postView)
//
//        }
//        return postViewsArray
//    }


    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
        setupConstraints()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
