//
//  NetworkService.swift
//  UIProect
//
//  Created by Герман Яренко on 3.12.23.
//
import Foundation

final class NetworkService {
    let basicURL = "https://kudago.com/public-api/v1.4/news"
    
    func getNews() async -> [News] {
        guard var url = URL(string: basicURL) else { return [] }
        
        url.append(queryItems: [
            URLQueryItem(name: "fields", value: "id,publication_date,title,description,body_text,images"),
            URLQueryItem(name: "text_format", value: "plain"),
            URLQueryItem(name: "page_size", value: "100")
        ])
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            decoder.dateDecodingStrategy = .secondsSince1970
            return try decoder.decode(NewsResults.self, from: data).results
        } catch {
            print(error)
            return []
        }
    }
}
