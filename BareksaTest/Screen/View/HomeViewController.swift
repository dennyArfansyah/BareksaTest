//
//  HomeViewController.swift
//  BareksaTest
//
//  Created by Denny Arfansyah on 05/07/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private(set) var dataSource: Datasource!
    var viewModel: HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.dataSource = Datasource(caller: self, viewModel: viewModel)
        
        self.tableView.dataSource = dataSource
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = UITableView.automaticDimension
//        self.tableView.register(UINib(nibName: FirstCell.reusedIdentifier, bundle: nil), forCellReuseIdentifier: SecondCell.reusedIdentifier)
        self.tableView.register(UINib(nibName: SecondCell.reusedIdentifier, bundle: nil), forCellReuseIdentifier: SecondCell.reusedIdentifier)
    
    }
    
}

struct DetailData {
    
    var title: String
    var detail: [Detail]
}
