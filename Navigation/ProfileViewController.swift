
import UIKit

class ProfileViewController: UIViewController {
    
    let postList = [robberyPost, eatingPost, elephantPost, camelPost]
    var profileTableView = UITableView()
    let myCustomHeader = MyCustomHeader()
    
    let headerID = "headerId"
    let cellID = "cellId"
        
    func setupTableView() {
        profileTableView.contentInsetAdjustmentBehavior = .never
        profileTableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.cellID)
//        profileTableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: PostTableViewCell.cellID)
        profileTableView.delegate = self
        profileTableView.dataSource = self
        profileTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileTableView)
    }
    
    func setupMyCustomHeader() {
        profileTableView.register(MyCustomHeader.self, forHeaderFooterViewReuseIdentifier: headerID)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            profileTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            profileTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            profileTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupTableView()
        setupMyCustomHeader()
        setConstraints()
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.cellID, for: indexPath) as! PostTableViewCell
        let post = postList[indexPath.row]
//        var content = cell.defaultContentConfiguration()
        cell.titleLabel?.text = post.title
        cell.newsImageView?.image = UIImage(named: post.image)
        cell.descriptionLabel?.text = post.description
        cell.likesCountLabel?.text = "Likes: \(post.likes)"
        cell.viewsCountLabel?.text = "Views: \(post.views)"
        return cell
    }

    // MARK: - Table view delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if #available(iOS 15, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID) as! MyCustomHeader
        return header
    }
}
