//
//  HomeViewModel.swift
//  BareksaTest
//
//  Created by Denny Arfansyah on 05/07/22.
//

import Foundation
import Toast_Swift

class HomeViewModel {
    
    var caller: HomeViewController
    var service: HomeService

    init(caller: HomeViewController, service: HomeService = HomeServiceManager()) {
        self.caller = caller
        self.service = service
        getDetail()
    }

    private func getDetail() {
        self.service.getDetail(completion: { [weak self] result in
            switch result {
            case .success(let detail):
                print(detail)
                self?.set(with: detail)
            case .failure(let error):
                print(error.localizedDescription)
                self?.showToast(with: error.localizedDescription)
            }
        })
    }
    
    private func set(with detail: [Detail]) {
//        let vc = DetailViewController()
//        vc.viewModel = DetailViewModel(caller: vc, weather: weather)
//        self.caller.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func showToast(with errorMessage: String) {
        self.caller.view.makeToast(errorMessage)
    }
    
}
