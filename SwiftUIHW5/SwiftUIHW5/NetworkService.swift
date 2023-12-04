//
//  NetworkService.swift
//  SwiftUIHW5
//
//  Created by Герман Яренко on 4.12.23.
//

import Foundation


class NetworkService {
    private let session = URLSession.shared
    
    func getNews(completion: @escaping ([NewsItem]) -> Void) {
        guard let url = URL(string: "https://kudago.com/public-api/v1.4/news/?fields=id,publication_date,title,body_text&text_format=text&actual_only=true") else { return }
        
        session.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let news = try JSONDecoder().decode(NewsModel.self, from: data).results
                completion(news ?? [])
//                print(news)
            } catch {
                print(error)
            }
        }.resume()
    }
}
