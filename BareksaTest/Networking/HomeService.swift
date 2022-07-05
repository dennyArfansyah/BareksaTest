//
//  HomeService.swift
//  BareksaTest
//
//  Created by Denny Arfansyah on 05/07/22.
//

import Foundation
import Alamofire

protocol HomeService {
    
    func getDetail(completion: @escaping (Result<[Detail], ServerError>) -> Void)
    
}

class HomeServiceManager: HomeService {
    
    func getDetail(completion: @escaping (Result<[Detail], ServerError>) -> Void) {
        
        let url = URL(string: Constant.detailUrl)!
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseJSON { response in

            print(response)

            switch response.result {
            case .success:
                do {
                    guard let data = response.data else {
                        completion(.failure(.unknownError))
                        return
                    }

                    let product = try JSONDecoder().decode(Product.self, from: data)
                    let details = product.data.map { return Detail(code: $0.code, name: $0.name, details: $0.details) }
                    completion(.success(details))
                } catch {
                    if let statusCode = response.response?.statusCode {
                        completion(.failure(ServerError(code: statusCode)))
                    }
                }
            case .failure(_):
                if let statusCode = response.response?.statusCode {
                    completion(.failure(ServerError(code: statusCode)))
                }
                completion(.failure(.unknownError))
            }

        }
    }
    
}
