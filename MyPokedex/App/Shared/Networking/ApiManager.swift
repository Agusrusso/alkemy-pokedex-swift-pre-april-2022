//
//  ApiManager.swift
//  MyPokedex
//
//  Created by Jesus Nieves on 23/04/2022.
//

import Foundation
import Alamofire

class ApiManager {
    
    static let shared = ApiManager()

    // GET / POST / DELETE / UPDATE
    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void) {
        AF.request(url).response { response in
            completion(response.result)
        }
    }
    
}
