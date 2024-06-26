//
// ViewController.swift
// WongnaiInternAssignment
//
// Created by Warat Poovorakit on 22/3/2567 BE.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    internal let viewModel = MainViewModel()
    private var currentPage = 1
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.refreshControl?.beginRefreshing()
        fetchPhotos()
    }
    
    // MARK: - Table View Setup
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ProductsTableViewCell", bundle: nil), forCellReuseIdentifier: ProductsTableViewCell.reuseIdentifier)
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    // MARK: - Fetch Photos
    private func fetchPhotos() {
        viewModel.fetchPhotos(page: currentPage) { [weak self] result in
            DispatchQueue.main.async {
                self?.tableView.refreshControl?.endRefreshing()
            }
            
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    self?.currentPage += 1
                }
            case .failure(let error):
                print("Error fetching photos: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: - Refresh Data
    @objc internal func refreshData() {
        viewModel.clearPhotos()
        tableView.reloadData()
        fetchPhotos()
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfPhotos
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductsTableViewCell.reuseIdentifier, for: indexPath) as? ProductsTableViewCell,
              let photo = viewModel.photo(at: indexPath.row) else {
            return UITableViewCell()
        }
        
        cell.configure(with: photo)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
