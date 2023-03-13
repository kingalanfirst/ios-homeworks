
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
        let imageView = ScaleAspectFitImageView()
        imageView.image = UIImage()
        imageView.backgroundColor = .black
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
//        contentView.addSubview(descriptionLabel)
        contentView.addSubview(likesCountLabel)
        contentView.addSubview(viewsCountLabel)
    }
    
//    var contraint: NSLayoutConstraint?
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            newsImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            newsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            newsImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),

//            descriptionLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 16),
//            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            likesCountLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 16), // was descriptionLabel
            likesCountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesCountLabel.trailingAnchor.constraint(equalTo: contentView.centerXAnchor),

            viewsCountLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 16), // was descriptionLabel
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

public class ScaleAspectFitImageView : UIImageView {
    // constraint to maintain same aspect ratio as the image
    private var aspectRatioConstraint:NSLayoutConstraint? = nil
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        self.setup()
    }
    
    public override init(frame:CGRect) {
        super.init(frame:frame)
        self.setup()
    }
    
    public override init(image: UIImage!) {
        super.init(image:image)
        self.setup()
    }
    
    public override init(image: UIImage!, highlightedImage: UIImage?) {
        super.init(image:image,highlightedImage:highlightedImage)
        self.setup()
    }
    
    override public var image: UIImage? {
        didSet {
            self.updateAspectRatioConstraint()
        }
    }
    
    private func setup() {
        self.contentMode = .scaleAspectFit
        self.updateAspectRatioConstraint()
    }
    
//    Removes any pre-existing aspect ratio constraint, and adds a new one based on the current image
    private func updateAspectRatioConstraint() {
//         remove any existing aspect ratio constraint
        if let c = self.aspectRatioConstraint {
            self.removeConstraint(c)
        }
        self.aspectRatioConstraint = nil
        
        if let imageSize = image?.size, imageSize.height != 0
        {
            let aspectRatio = imageSize.width / imageSize.height
            let rationConstraint = NSLayoutConstraint(item: self, attribute: .width,
                                                      relatedBy: .equal,
                                                      toItem: self,
                                                      attribute: .height,
                                                      multiplier: aspectRatio,
                                                      constant: 0)
            // a priority above fitting size level and below low
            //        rationConstraint.priority = (UILayoutPriorityDefaultLow + UILayoutPriorityFittingSizeLevel) / 2.0
            self.addConstraint(rationConstraint)
            self.aspectRatioConstraint = rationConstraint
        }
    }
}
