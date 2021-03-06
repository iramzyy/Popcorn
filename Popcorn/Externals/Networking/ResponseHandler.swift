//
//  ResponseHandler.swift
//  Popcorn
//
//  Created by Ramzy on 15/04/2021.
//

import Foundation
import Alamofire


protocol HandleRequestResponse {
    func handleResponse<T: ResponseDecoder>(_ response: AFDataResponse<Data>, completion: CallResponse<T>)
}

extension HandleRequestResponse {
    func handleResponse<T: ResponseDecoder>(_ response: AFDataResponse<Data>, completion: CallResponse<T>) {
        switch response.result {
        case .failure(let error):
            completion?(ServerResponse<T>.failure(error))
        case .success(let value):
            do {
                let modules = try T(data: value)
                completion?(ServerResponse<T>.success(modules))
            } catch {
                completion?(ServerResponse<T>.failure(error))
            }
        }
    }
}
