//
//  NetworkService.swift
//  ViewController. Single Responsibility Principle.
//
//  Created by Алексей Пархоменко on 31/05/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import Foundation
protocol Networking {
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void)

}
class NetworkService: Networking {

    // построение запроса данных по URL
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func createDataTask(from requst: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: requst, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        })
    }
}
