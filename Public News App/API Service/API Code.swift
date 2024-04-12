//
//  API Code.swift
//  Public News App
//
//  Created by R95 on 10/04/24.
//

import Foundation

class APICalling {
    // MARK: FST Api Func.
    func countryApiNews(country: String,category: String,_ load: @escaping(_ value: CountryApiModel) -> Void) {
        let link = "https://newsapi.org/v2/top-headlines?country=\(country)&category=\(category)&apiKey=517dee2e1bd54dac997c0fee78bee411"
                    
        var urlRequest = URLRequest(url: URL(string: link)!)
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) { data, respo, error in
            do {
                if(data != nil) {
                    let countryApiModel = try JSONDecoder().decode(CountryApiModel.self, from: data!)
                    load(countryApiModel)
                }
                else {
                    print("Data is not Resived")
                }
            }
            catch {
                print("Error is \(error.localizedDescription)")
            }
        }.resume()
    }
    
    // MARK: SEC Api Func.
    func searchApiNews(topic: String, _ load: @escaping(_ news: SearchApiModel)-> Void) {
        let link = "https://newsapi.org/v2/everything?q=\(topic)&from=2024-03-12&sortBy=publishedAt&apiKey=517dee2e1bd54dac997c0fee78bee411"
                    
        var urlRequest = URLRequest(url: URL(string: link)!)
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) { data, respo, error in
            do {
                if(data != nil) {
                    var searchApiModel = try JSONDecoder().decode(SearchApiModel.self, from: data!)
                    load(searchApiModel)
                }
                else {
                    print("Data is not Resived")
                }
            }
            catch {
                print("Error is \(error.localizedDescription)")
            }
        }.resume()
    }
}
