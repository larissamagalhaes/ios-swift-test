//
//  NotesDataSource.swift
//  TestApp
//
//  Created by Larissa on 2019-11-18.
//  Copyright © 2019 AlayaCare. All rights reserved.
//

import Foundation


class NotesDataSource {
    
    func getNotes() -> [Note] {
        var notes: [Note] = []
        for _ in 0...30 {
            let note = Note(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum")
            notes.append(note)
        }
        return notes
    }
    
}
