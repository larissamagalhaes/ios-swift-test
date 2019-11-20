//
//  Note.swift
//  TestApp
//
//

import Foundation

class Note {
    let id: String
    var text: String
    var date: Date
    
    init(text: String) {
        self.text = text
        self.date = Date()
        self.id = UUID().uuidString

    }
}
