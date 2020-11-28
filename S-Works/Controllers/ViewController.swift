//
//  ViewController.swift
//  S-Works
//
//  Created by Prabhakar Patil on 28/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var clientsViewModel: ClientsViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
        clientsViewModel = ClientsViewModel(completion: {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.register(ClientDetailTableViewCell.nib, forCellReuseIdentifier: ClientDetailTableViewCell.reuseIdentifier)
    }
    
    private func setupNavigationBar() {
        navigationItem.largeTitleDisplayMode = .automatic
        navigationItem.title = "Clients"
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clientsViewModel?.orders?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ClientDetailTableViewCell.reuseIdentifier, for: indexPath) as? ClientDetailTableViewCell else {
            assert(false, "Failed to initialise cell as ClientDetailTableViewCell")
            return UITableViewCell()
        }
        if let order = clientsViewModel.orders?[indexPath.row] {
            cell.order = order
            cell.name.text = order.name
            cell.addressLabel.text = order.address
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }

    
}
