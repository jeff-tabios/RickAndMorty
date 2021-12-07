//
//  APIService.swift
//  RM
//
//  Created by Jeffrey Tabios on 11/2/21.
//

import Foundation
import Alamofire
import Combine

protocol APIService {
    func request<T: Decodable>(url: String, params: [String: Any]) -> Future<T, Error>
}

extension APIService {
    func request<T: Decodable>(url: String, params: [String: Any]) -> Future<T, Error> {
        return Future { promise in
            let request = AF.request(url, parameters: params)
            
            request.responseDecodable(of: T.self) { (response) in
                if let val = response.value {
                    promise(.success(val))
                } else if let err = response.error {
                    promise(.failure(err))
                }
            }
        }
    }
}
