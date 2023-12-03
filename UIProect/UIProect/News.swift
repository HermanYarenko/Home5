//
//  News.swift
//  UIProect
//
//  Created by Герман Яренко on 3.12.23.
//

import Foundation

struct NewsResults: Decodable {
    let results: [News]
}

struct News: Decodable, Identifiable {
    let id: Int
    let publicationDate: Date
    let title: String
    let description: String
    let bodyText: String
    
    private let images: [NewsImage]?
    var imageURL: URL? {
        guard let stringURL = images?.first?.image else { return nil }
        return URL(string: stringURL)
    }
    
    private struct NewsImage: Decodable {
        let image: String
    }
}

extension News {
    static let example = News(
        id: 47770,
        publicationDate: Date.now,
        title: "Петербуржцев приглашают обменяться игрушками на «Новогоднем шеринге»",
        description: "Акция пройдёт сразу в нескольких местах.\n",
        bodyText: "2 декабря экологическое движение «РазДельный Сбор» устроит «Новогодний шеринг». Во время этой акции можно обменяться новогодними игрушками и декором.\nПетербуржцам предлагают сдать ненужные им игрушки и взамен забрать всё, что придётся по душе. Участники акции могут приносить ёлочные украшения, новогодние фигурки, мишуру, наклейки, венки, упаковочную бумагу, открытки и прочий декор.\nНа обмен не принимают изделия из стекла и керамики, а также всё огнеопасное: петарды, фейерверки, бенгальские огни. Организаторы просят приносить вещи в хорошем состоянии.\nНеразобранные украшения передадут в благотворительные фонды. Акция пройдёт в разных пунктах сбора. Список есть  https://dzen.ru/news/?favid=254074219 . Рекомендации от KudaGo, планы на выходные, интересные события, места и подборки, а также новости без политики — читайте нас там, где вам удобно.\n2 декабря экологическое движение «РазДельный Сбор» устроит «Новогодний шеринг». Во время этой акции можно обменяться новогодними игрушками и декором.\nПетербуржцам предлагают сдать ненужные им игрушки и взамен забрать всё, что придётся по душе. Участники акции могут приносить ёлочные украшения, новогодние фигурки, мишуру, наклейки, венки, упаковочную бумагу, открытки и прочий декор.\nНа обмен не принимают изделия из стекла и керамики, а также всё огнеопасное: петарды, фейерверки, бенгальские огни. Организаторы просят приносить вещи в хорошем состоянии.\nНеразобранные украшения передадут в благотворительные фонды. Акция пройдёт в разных пунктах сбора. Список есть  https://dzen.ru/news/?favid=254074219 . Рекомендации от KudaGo, планы на выходные, интересные события, места и подборки, а также новости без политики — читайте нас там, где вам удобно.\n",
        images: [NewsImage(image: "https://media.kudago.com/images/news/26/d7/26d757a1be1016d06f9ba5e664862103.jpg")]
    )
}