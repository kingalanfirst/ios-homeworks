
import UIKit

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let postList = [robberyPost, eatingPost, elephantPost, camelPost]

    var profileTableView = UITableView()
    let myCustomHeader = MyCustomHeader()
    
    let headerID = "headerId"
    let headerID2 = "headerId2"
    let cellID = "cellId"
    let collectionCellID = "collectionCellId"
    
    // MARK: - new homework
    lazy var backgroundView: UIView = {
        let bcgrndView = UIView()
        bcgrndView.frame = view.safeAreaLayoutGuide.layoutFrame
        bcgrndView.isHidden = true
        bcgrndView.backgroundColor = UIColor.clear
        return bcgrndView
    }()
    lazy var closeButton: UIButton = {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let button = UIButton()
        button.frame = CGRect(x: backgroundView.bounds.maxX - 34, y: 120, width: 30, height: 30)
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.setPreferredSymbolConfiguration(configuration, forImageIn: .normal)
        button.imageView?.isHidden = true
        button.tintColor = .clear
        button.addTarget(self, action: #selector(profileImageViewClosed), for: .touchUpInside)
        return button
    }()
    //
        
    func setupTableView() {
        profileTableView.contentInsetAdjustmentBehavior = .never
        profileTableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.cellID)
        profileTableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.cellID)
        profileTableView.delegate = self
        profileTableView.dataSource = self
//        profileTableView.rowHeight = UITableView.automaticDimension
        profileTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileTableView)
    }
    
    func setupMyCustomHeader() {
        profileTableView.register(MyCustomHeader.self, forHeaderFooterViewReuseIdentifier: headerID)
        profileTableView.register(OneMoreCustomHeader.self, forHeaderFooterViewReuseIdentifier: headerID2)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            profileTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            profileTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            profileTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    // MARK: - new homework
    
    func setupBackgroundView() {
        backgroundView.addSubview(closeButton)
        view.addSubview(backgroundView)
    }
    func animateCloseButtonAppear() {
        closeButton.imageView?.isHidden = false
        closeButton.tintColor = .white
    }
    func animateCloseButtonDisappear() {
        closeButton.tintColor = .clear
    }
    func animateProfileImageOpening() {
        backgroundView.isHidden = false
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        let imageView = myCustomHeader.profileHeaderView.profileImageView
        imageView.frame = CGRect(x: backgroundView.bounds.minX,
                                 y: backgroundView.bounds.midY - backgroundView.bounds.width/2,
                                 width: backgroundView.bounds.width,
                                 height: backgroundView.bounds.width)
        imageView.layer.cornerRadius = 0
        backgroundView.addSubview(imageView)
    }
    func animateProfileImageClosing() {
        backgroundView.backgroundColor = .clear
        let imageView = myCustomHeader.profileHeaderView.profileImageView
        imageView.frame = CGRect(x: backgroundView.bounds.minX,
                                 y: backgroundView.bounds.midY - backgroundView.bounds.width/2,
                                 width: backgroundView.bounds.width,
                                 height: backgroundView.bounds.width)
        imageView.layer.cornerRadius = 0
        imageView.frame = CGRect(x: 16, y: 16, width: 150, height: 150)
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
    }

    @objc func profileImageViewClicked(_ sender: UITapGestureRecognizer) {
        setupBackgroundView()
                
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: .curveEaseIn,
                       animations: {
            self.animateProfileImageOpening()
        },
                       completion: { finished in
        })
        UIView.animate(withDuration: 0.3,
                       delay: 0.5,
                       options: .curveEaseIn,
                       animations: {
            self.animateCloseButtonAppear()
        },
                       completion: { finished in
        })
    }
    
    @objc func profileImageViewClosed() {
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveEaseIn,
                       animations: { [weak self] in
            guard let self = self else { return }
            self.animateCloseButtonDisappear()
        },
                       completion: { finished in
            self.closeButton.imageView?.isHidden = true
        })
        UIView.animate(withDuration: 0.5,
                       delay: 0.3,
                       options: .curveEaseIn,
                       animations: { [weak self] in
            guard let self = self else { return }
            self.animateProfileImageClosing()
        },
                       completion: { finished in
            self.backgroundView.isHidden = true
        })
    }
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupTableView()
        setupMyCustomHeader()
        setConstraints()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
//            guard let self = self else { return }
//            print("Bukaki added")
//            self.postList.append(camelPost)
//        }

    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return postList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.cellID, for: indexPath) as! PhotosTableViewCell
            
            return cell1
        } else {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.cellID, for: indexPath) as! PostTableViewCell
            let post = postList[indexPath.row]
            cell2.titleLabel.text = "\(post.author). \(post.title)"
            cell2.newsImageView.image = UIImage(named: post.image)
            cell2.descriptionLabel.text = post.description
            cell2.likesCountLabel.text = "Likes: \(post.likes)"
            cell2.viewsCountLabel.text = "Views: \(post.views)"
            return cell2
        }
    }


    // MARK: - Table view delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if #available(iOS 15, *) {
            tableView.sectionHeaderTopPadding = 0
        }

        if section == 0 {
            return UITableView.automaticDimension
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID) as! MyCustomHeader
            
            // MARK: - new homework
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(profileImageViewClicked(_ :)))
            tapRecognizer.numberOfTapsRequired = 1
            tapRecognizer.numberOfTouchesRequired = 1
            tapRecognizer.delegate = self
            header.profileHeaderView.profileImageView.isUserInteractionEnabled = true
            header.profileHeaderView.profileImageView.addGestureRecognizer(tapRecognizer)
            //

            return header
        } else {
            let header2 = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID2) as! OneMoreCustomHeader
            return header2
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let photosViewController = PhotosViewController()
            navigationController?.pushViewController(photosViewController, animated: true)
        }
    }
}
