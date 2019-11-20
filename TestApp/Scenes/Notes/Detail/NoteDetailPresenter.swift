//
//  NewNotePresenter.swift
//  TestApp
//
//  Created by Larissa on 2019-11-19.
//  Copyright © 2019 AlayaCare. All rights reserved.
//

import Foundation

protocol INoteDetail {
    func viewDidLoad()
    func didTouchSave(text: String)
    func save(note: Note)
    func textViewDidChange(text: String)
}


class NoteDetailPresenter: INoteDetail {
    
    private weak var view: NoteDetailView?
    private let dataSource: NotesDataSource
    private let id: String?
    
    init(view: NoteDetailView, dataSource: NotesDataSource, id: String? = nil) {
        self.view = view
        self.dataSource = dataSource
        self.id = id
    }
    
    func viewDidLoad() {
        if let id = self.id {
            getNoteBy(id: id)
        } else {
            view?.disableButton()
        }
    }
    
    private func getNoteBy(id: String) {
        dataSource.getNoteBy(id: id) { result in
            DispatchQueue.main.async {
                if let note = result {
                    self.view?.showNote(text: note.text)
                }
            }
        }
    }
    
    func save(note: Note) {
        dataSource.addNote(note: note)
    }
    
    func didTouchSave(text: String) {
        if(!text.isEmpty) {
            if let id = self.id {
                updateNoteBy(id: id, text: text)
            } else {
                let note = Note(text: text)
                add(note: note)
            }
        }
    }
    
    private func updateNoteBy(id: String, text: String) {
        dataSource.updateNoteBy(id: id, text: text) {
            DispatchQueue.main.async {
                self.view?.noteSaved()
            }
        }
    }
    
    private func add(note: Note) {
        dataSource.addNote(note: note) {
            DispatchQueue.main.async {
                self.view?.noteSaved()
            }
        }
    }
    
    func textViewDidChange(text: String) {
        view?.enableButton(isEnable: !text.isEmpty)
    }
}
