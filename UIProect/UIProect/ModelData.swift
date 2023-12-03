//
//  ModelData.swift
//  UIProect
//
//  Created by Герман Яренко on 3.12.23.
//


import Foundation

final class ModelData: ObservableObject {
    @Published var news = [News]()
}
