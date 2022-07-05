//
//  Datasource.swift
//  BareksaTest
//
//  Created by Denny Arfansyah on 05/07/22.
//

import UIKit
import Combine

class Datasource: NSObject, UITableViewDataSource {
    
    private(set) var caller: HomeViewController
    private(set) var viewModel: HomeViewModel!
    private var subscriptions = Set<AnyCancellable>()
    private(set) var detail = [DetailData]()
    
    init(caller: HomeViewController, viewModel: HomeViewModel) {
        self.caller = caller
        self.viewModel = viewModel
        super.init()
        self.subscription()
        self.registerCell()
    }
    
    func subscription() {
        self.subscriptions = [
            self.viewModel.$detail.sink(receiveValue: { value in
                self.detail = value
                self.caller.tableView.reloadData()
            })
        ]
    }
    
    private func registerCell() {
        self.caller.tableView.register(UINib(nibName: SecondCell.reusedIdentifier, bundle: nil), forCellReuseIdentifier: SecondCell.reusedIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SecondCell.reusedIdentifier, for: indexPath) as! SecondCell
        cell.selectionStyle = .none
        let data = detail[indexPath.row]
        cell.setData(with: data.title, details: data.detail)
        return cell
    }
    
}
