//
//  UIProectApp.swift
//  UIProect
//
//  Created by Герман Яренко on 2.12.23.
//

import SwiftUI

@main
struct NewsApp: App {
    var body: some Scene {
        WindowGroup {
            NewsList(modelData: ModelData())
        }
    }
}
