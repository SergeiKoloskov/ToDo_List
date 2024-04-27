//
//  ItemModel.swift
//  ToDo_List
//
//  Created by MacBookPro on 01.05.2021.
//

import Foundation
import SwiftUI

struct ItemModel: Identifiable, Codable {
    let title: String
    let isCompleted: Bool
    let id: String
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = UUID().uuidString
        self.title = title
        self.isCompleted = isCompleted
    } // крч код сверху создает 2-е ситуации, первая когда при добавлении нового айтема по модели ItemModel нельзя будет ввести id и он сам его создаст и вторая ситуация когда нужно изменить item и не создавать ему новый id там можно будет вписать id конкретно
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
}
