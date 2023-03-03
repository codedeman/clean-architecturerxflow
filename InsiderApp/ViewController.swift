//
//  ViewController.swift
//  InsiderApp
//
//  Created by Kevin on 3/3/23.
//

import UIKit
import Home
import RxFlow
import SwiftUI
import UIKit
import Onboarding

class ViewController:  UIViewController {

    let scrollView = UIScrollView()
    let contentView = UIView()
    var dataSource: [ApplicationRoute] = [.home , .onboarding]
    private lazy var tableView: UITableView = {
        let tbl = UITableView()
        return tbl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let text = dataSource[indexPath.row]


        cell.textLabel?.text = text.rawValue
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let router = dataSource[indexPath.row]
        Application.shared.routerScreen(router: router, viewController: self)
    }
}
