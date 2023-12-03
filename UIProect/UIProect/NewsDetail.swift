//
//  NewsDetail.swift
//  UIProect
//
//  Created by Герман Яренко on 3.12.23.
//

//import Foundation
//import SwiftUI
//
//struct NewsDetail: View {
//    let news: News
//    
//    var body: some View {
//        ScrollView {
//            Text(news.title)
//                .font(.title)
//                .padding()
//
//            if let imageURL = news.imageURL {
//                AsyncImage(url: imageURL) { image in
//                    image.resizable().aspectRatio(contentMode: .fit)
//                } placeholder: {
//                    ProgressView()
//                }
//                
//            } else {
//                Divider()
//            }
//
//            Text(news.bodyText)
//                .font(.body)
//                .padding()
//        }
//    }
//}
//
//#Preview {
//    NewsDetail(news: News.example)
//}
