//
//  DataFetcherService.swift
//  ViewController. Single Responsibility Principle.
//
//  Created by Миронов Влад on 10.09.2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import Foundation


class DataFetcherService {
    var dataFetcher: DataFetcher
    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    

    func fetchNewGames(completion: @escaping (AppGroup?) -> Void) {
        let urlNewGames = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/10/explicit.json"
        dataFetcher.fetchGenericJsonData(urlString: urlNewGames, response: completion)

    }
    
    func fetchFreeGames(completion: @escaping (AppGroup?) -> Void) {
        
        let urlFreeGames = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free-ipad/all/10/explicit.json"
        dataFetcher.fetchGenericJsonData(urlString: urlFreeGames, response: completion)

    }
    
    // декодируем полученные JSON данные в конкретную модель данных
    func fetchCountry(completion: @escaping ([Country]?) -> Void) {
        let urlString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"
        dataFetcher.fetchGenericJsonData(urlString: urlString, response: completion)
        
    }
}
