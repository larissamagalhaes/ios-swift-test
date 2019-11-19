//
//  Note.swift
//  TestApp
//
//

import Foundation

class Note {
    var id: Int = 0
    var text: String
    var date: Date
    
    init(text: String) {
        self.id = id + 1
        self.text = text
        self.date = Date()
    }
}
