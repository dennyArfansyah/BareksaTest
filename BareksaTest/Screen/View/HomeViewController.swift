//
//  HomeViewController.swift
//  BareksaTest
//
//  Created by Denny Arfansyah on 05/07/22.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
        
        HomeViewModel(caller: self)


    }

}
