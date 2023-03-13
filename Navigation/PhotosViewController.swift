
import UIKit

class PhotosViewController: UIViewController, UINavigationBarDelegate, UIGestureRecognizerDelegate {
    
    // MARK: - diploma work
    lazy var chosenImageView = UIImageView()
    lazy var openedImageView = UIImageView()
    
    //

    let navigationBar = UINavigationBar(frame: .zero)
    
    private enum LayoutConstant {
        static let spacing: CGFloat = 8.0
    }
    
    // MARK: - diploma work
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
        button.addTarget(self, action: #selector(photoImageViewClosed), for: .touchUpInside)
        return button
    }()
    //

    private let photosCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .white
        var scrollDetector = UISwipeGestureRecognizer(target: PhotosViewController.self, action: #selector(coordinatesChanger(_ :)))
        collectionView.isUserInteractionEnabled = true
        collectionView.addGestureRecognizer(scrollDetector)
        return collectionView
    }()
            
    @objc private func barButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func coordinatesChanger(_ sender: UISwipeGestureRecognizer) {
        
    }
    
    private func setupNavigationBar() {
        navigationBar.backgroundColor = .systemGray6
        navigationBar.delegate = self
        
        let navigationItem = UINavigationItem()
        navigationItem.title = "Photo Gallery"
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

    private func setupViews() {
        view.backgroundColor = .systemGray6
        view.addSubview(photosCollectionView)
        
        photosCollectionView.dataSource = self
        photosCollectionView.delegate = self
        photosCollectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
    }
    
    private func setupConstraints() {
        photosCollectionView.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            navigationBar.bottomAnchor.constraint(equalTo: photosCollectionView.topAnchor),

            photosCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            photosCollectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            photosCollectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    // MARK: - diploma work
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
    
    func animatePhotoImageClosing() {
        backgroundView.backgroundColor = .clear
        openedImageView.contentMode = .scaleAspectFill
        openedImageView.clipsToBounds = true
        openedImageView.layer.borderWidth = 0
        openedImageView.frame = chosenImageView.frame
        print("frame \(chosenImageView.frame)")
    }
    
    @objc func photoImageViewClosed() {
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       options: .curveEaseIn,
                       animations: { [weak self] in
            guard let self = self else { return }
            self.animateCloseButtonDisappear()
        },
                       completion: { finished in
            self.closeButton.imageView?.isHidden = true
        })
        UIView.animate(withDuration: 0.3,
                       delay: 0.1,
                       options: .curveEaseIn,
                       animations: { [weak self] in
            guard let self = self else { return }
            self.animatePhotoImageClosing()
        },
                       completion: { finished in
            self.backgroundView.isHidden = true
            self.backgroundView.subviews.forEach { $0.removeFromSuperview() }
        })
    }
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
        setupConstraints()
        photosCollectionView.reloadData()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        print("frame \(chosenImageView.frame)")
//
//    }

}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell

        let photo = photos[indexPath.row]
        cell.photoImageView.image = UIImage(named: photo.imageName)
        cell.contentView.backgroundColor = .clear
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // MARK: - diploma work
        let frame = collectionView.convert(collectionView.cellForItem(at: indexPath)!.frame, to: backgroundView)
//        let frame = collectionView.layoutAttributesForItem(at: indexPath)?.frame
        chosenImageView.frame = frame
        
        let photo = photos[indexPath.row]
        let imageView = UIImageView()
        imageView.image = UIImage(named: photo.imageName)
        imageView.frame = frame
        imageView.clipsToBounds = true

        print(chosenImageView.frame)
        print(frame)

        func animatePhotoImageOpening() {
            backgroundView.isHidden = false
            backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
            imageView.contentMode = .scaleAspectFill
            imageView.layer.borderWidth = 3
            imageView.layer.borderColor = UIColor.white.cgColor
            
            imageView.translatesAutoresizingMaskIntoConstraints = true
            imageView.frame = CGRect(x: backgroundView.bounds.minX,
                                           y: backgroundView.bounds.midY - backgroundView.bounds.width/2,
                                           width: backgroundView.bounds.width,
                                           height: backgroundView.bounds.width)
            openedImageView = imageView
            backgroundView.addSubview(openedImageView)
        }

        setupBackgroundView()
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveEaseIn,
                       animations: {
            animatePhotoImageOpening()
        },
                       completion: { finished in
        })
        UIView.animate(withDuration: 0.3,
                       delay: 0.3,
                       options: .curveEaseIn,
                       animations: {
            self.animateCloseButtonAppear()
        },
                       completion: { finished in
        })
        //
    }
    
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = itemWidth(for: view.frame.width, spacing: LayoutConstant.spacing)

        return CGSize(width: width, height: width)
    }

    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 3

        let totalSpacing: CGFloat = (itemsInRow + 1) * spacing
        let finalWidth = (width - totalSpacing) / itemsInRow

        return floor(finalWidth)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: LayoutConstant.spacing, left: LayoutConstant.spacing, bottom: LayoutConstant.spacing, right: LayoutConstant.spacing)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }
}
