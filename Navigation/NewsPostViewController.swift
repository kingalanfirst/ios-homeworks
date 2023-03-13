
import UIKit

class NewsPostViewController: UIViewController, UINavigationBarDelegate {
    
    var indexOfPostList: Int!
        
    let navigationBar = UINavigationBar(frame: .zero)
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "\(postList[indexOfPostList].author). \(postList[indexOfPostList].title)"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var newsImageView: UIImageView = {
        let imageView = ScaleAspectFitImageView()
        imageView.image = UIImage(named: postList[indexOfPostList].image)
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = postList[indexOfPostList].description
        label.font = UIFont.systemFont (ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var likesCountLabel: UILabel = {
        let label = UILabel()
        label.text = "Likes: \(postList[indexOfPostList].likes)"
        label.font = UIFont.systemFont (ofSize: 16, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        let tapLikes = LikesTapGesture(target: self, action: #selector(likesCountLabelClicked(_ :)))
//        tapLikes.indexPath = indexPath
        label.addGestureRecognizer(tapLikes)
        label.isUserInteractionEnabled = true

        return label
    }()
    lazy var viewsCountLabel: UILabel = {
        let label = UILabel()
        label.text = "Views: \(postList[indexOfPostList].views)"
        label.font = UIFont.systemFont (ofSize: 16, weight: .regular)
        label.textColor = .black
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews() {
        view.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(newsImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(likesCountLabel)
        contentView.addSubview(viewsCountLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            navigationBar.bottomAnchor.constraint(equalTo: contentView.topAnchor),

            contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            newsImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            newsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
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
        ])
    }
    
    @objc private func barButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func likesCountLabelClicked(_ sender: LikesTapGesture) {
        postList[indexOfPostList].likes += 1
        likesCountLabel.text = "Likes: \(postList[indexOfPostList].likes)"
    }
    
    private func setupNavigationBar() {
        navigationBar.backgroundColor = .gray
        navigationBar.delegate = self
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        
        let navigationItem = UINavigationItem()
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.imageView?.contentMode = .scaleAspectFit
        backButton.setTitle(" Back", for: .normal)
        backButton.setTitleColor(backButton.tintColor, for: .normal)
        backButton.addTarget(self, action: #selector(barButtonAction), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationBar.items = [navigationItem]
        view.addSubview(navigationBar)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
        setupViews()
        setupConstraints()
    }
}
