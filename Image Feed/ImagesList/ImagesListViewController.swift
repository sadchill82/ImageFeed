import UIKit

final class ImagesListViewController: UIViewController {
    private let ShowSingleImageSegueIdentifier = "ShowSingleImage"

    @IBOutlet private var tableView: UITableView!

    private var photosName = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        photosName = Array(0..<20).map{ "\($0)" }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ShowSingleImageSegueIdentifier {
            let viewController = segue.destination as! SingleImageViewController
            let indexPath = sender as! IndexPath
            let imageName = photosName[indexPath.row]
            let image = UIImage(named: "\(imageName)_full_size") ?? UIImage(named: imageName)
            viewController.image = image
        } else {
            super.prepare(for: segue, sender: sender)
        }
    }

    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
}

extension ImagesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photosName.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImagesListCell.reuseIdentifier, for: indexPath)

        guard let imageListCell = cell as? ImagesListCell else {
            return UITableViewCell()
        }

        configCell(for: imageListCell, with: indexPath)

        return imageListCell
    }
}

extension ImagesListViewController {
    func configCell(for cell: ImagesListCell, with indexPath: IndexPath) {
        guard let image = UIImage(named: photosName[indexPath.row]) else {
            return
        }

        cell.cellImage.image = image
        cell.dateLabel.text = dateFormatter.string(from: Date())

        let isLiked = indexPath.row % 2 == 0
        let likeImage = isLiked ? UIImage(named: "like_button_on") : UIImage(named: "like_button_off")
        cell.likeButton.setImage(likeImage, for: .normal)
    }
}

extension ImagesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: ShowSingleImageSegueIdentifier, sender: indexPath)
    }
}
