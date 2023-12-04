//
//  DateCoverter.swift
//  SwiftUIHW5
//
//  Created by Герман Яренко on 4.12.23.
//

import Foundation


final class DateConverter {
    
    func dateConvert(timeInterval: Int) -> String {
        let publicationDate = Date(timeIntervalSince1970: TimeInterval(timeInterval))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm - d MMMM yyyy"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        return dateFormatter.string(from: publicationDate)
    }
    
}
