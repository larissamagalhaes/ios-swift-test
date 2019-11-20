//
//  NotesDataSource.swift
//  TestApp
//
//  Created by Larissa on 2019-11-18.
//  Copyright © 2019 AlayaCare. All rights reserved.
//

import Foundation


class NotesDataSource {
    
    static let shared = NotesDataSource()
    
    private var notes: [Note] = []
    
    private init() {
        for _ in 0...4 {
            let note = Note(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum")
            notes.append(note)
        }
    }
    
    func getNotes(completion: @escaping ([Note]) -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            completion(self.notes.sorted(by: { $0.id > $1.id}) )
        }
    }
    
    func getNoteBy(id: String, completion: @escaping ((Note)?) -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            completion(self.getNoteBy(id: id))
        }
    }
    
    func updateNoteBy(id: String, text: String, completion: @escaping () -> () = {}) {
        DispatchQueue.global(qos: .userInteractive).async {
            if let result = self.getNoteBy(id: id) {
                result.text = text
                result.date = Date()
            }
            completion()
        }
    }
    
    func addNote(note: Note, completion: @escaping () -> () = {}) {
        DispatchQueue.global(qos: .userInteractive).async {
            self.notes.append(note)
            completion()
        }
    }
    
    func searchBy(text: String, completion: @escaping (([Note]) -> ())) {
        DispatchQueue.global(qos: .userInteractive).async {
            let result = self.notes
                .filter { note in note.text.lowercased().contains(text.lowercased()) }
                .sorted(by: { $0.id > $1.id })
            completion(result)
        }
    }
    
    private func getNoteBy(id: String) -> Note? {
        return notes
            .filter { note in note.id == id }
            .first
    }
}
