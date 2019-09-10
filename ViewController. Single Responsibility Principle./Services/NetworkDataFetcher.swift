//
//  NetworkDataFetcher.swift
//  ViewController. Single Responsibility Principle.
//
//  Created by Алексей Пархоменко on 13.06.2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import Foundation
protocol DataFetcher {
    func fetchGenericJsonData<T: Decodable>(urlString: String, response: @escaping (T?) -> Void)
}
class NetworkDataFetcher: DataFetcher {
    
    var networking: Networking
    
    init(networking: Networking = NetworkService()) {
        self.networking = networking
    }
    
    func fetchGenericJsonData<T: Decodable>(urlString: String, response: @escaping (T?) -> Void){
        networking.request(urlString: urlString) { (data, error) in
            if let error = error {
                print(error.localizedDescription)
                response(nil)
            } else {
                let decoded = self.decodeJSON(type: T.self, from: data)
                response(decoded)
            }
           
        }
    }
    
    func decodeJSON<T:Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else {return nil}
            let response = try? decoder.decode(type.self, from: data)
            return response
    }
}
