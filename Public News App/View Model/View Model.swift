//
//  View Model.swift
//  Public News App
//
//  Created by R95 on 10/04/24.
//

import Foundation

class NewsViewModel : NSObject {
    
    var newsViewModel: APICalling = APICalling()
    
    // MARK: FST ApiCalling Func.
    func countryNewsCalling(country: String, category: String,_ load: @escaping(_ value: CountryApiModel) -> Void) {
        newsViewModel.countryApiNews(country: country, category: category) { news in
            if news != nil {
                load(news)
            }
        }
    }
    
    // MARK: SEC ApiCalling Func.
    func searchNewsCalling(topic: String,_ load: @escaping(_ topic: SearchApiModel) -> Void) {
        newsViewModel.searchApiNews(topic: topic) { news in
            if(news != nil) {
                load(news)
            }
        }
    }
}
