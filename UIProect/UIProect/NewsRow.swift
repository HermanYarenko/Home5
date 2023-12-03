//
//  NewsRow.swift
//  UIProect
//
//  Created by Герман Яренко on 3.12.23.
//

import Foundation
import SwiftUI

struct NewsRow: View {
    let news: News
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(news.title)
                .font(.headline)
            Text(news.description)
                .font(.subheadline)
            HStack {
                Spacer()
                Text(news.publicationDate.formatted())
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    NewsRow(news: News.example)
}
