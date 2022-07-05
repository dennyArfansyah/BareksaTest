//
//  HomeViewModel.swift
//  BareksaTest
//
//  Created by Denny Arfansyah on 05/07/22.
//

import Foundation
import Toast_Swift
import Combine

class HomeViewModel {
    
    var caller: HomeViewController
    var service: HomeService
    @Published var detail = [DetailData]()
    private var titles = ["Jenis Reksa Dana", "Imbal Hasil", "Dana Kelolaan", "Min. Pembelian", "Janga Waktu", "Tinggkat Resiko", "Peluncuran"]

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
        var detData = [DetailData]()
        
        for title in titles {
            detData.append(DetailData(title: title, detail: detail))
        }
    
        self.detail = detData
    }
    
    private func showToast(with errorMessage: String) {
        self.caller.view.makeToast(errorMessage)
    }
    
    
    
}
