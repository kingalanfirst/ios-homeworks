
import UIKit

class ProfileViewController: UIViewController {
    
    let postList = [robberyPost, eatingPost, elephantPost, camelPost]

    var profileTableView = UITableView()
    let myCustomHeader = MyCustomHeader()
    
    let headerID = "headerId"
    let headerID2 = "headerId2"

    let cellID = "cellId"
    let collectionCellID = "collectionCellId"

        
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
//        return 730
//        return UITableView.automaticDimension
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
            return header
        } else {
            let header2 = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID2) as! OneMoreCustomHeader
            return header2
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let photosViewController = PhotosViewController()
    //        tableView.isUserInteractionEnabled = false
            navigationController?.pushViewController(photosViewController, animated: true)
        }
    }
    
//    func tableView( _ tableView : UITableView,  titleForHeaderInSection section: Int) -> String? {
//        if section == 1 {
//            let title = "Hot news"
//            return title
//        } else {
//            return ""
//        }
//    }
}

//extension ProfileViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if indexPath.section == 0 {
//            let photosViewController = PhotosViewController()
//            navigationController?.pushViewController(photosViewController, animated: true)
//        }
//    }
//}

