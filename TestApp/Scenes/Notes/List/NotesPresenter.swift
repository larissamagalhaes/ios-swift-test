//
//  NotesPresenter.swift
//  TestApp
//
//

import Foundation

protocol INotesPresenter {
    
    func viewDidLoad()
    func reloadNotes()
    func didSelect(note: Note)
    func composeNewNote()
    func searchBy(text: String)
}

class NotesPresenter: INotesPresenter {
    
    private weak var view: NotesView?
    private let dataSource: NotesDataSource
    
    init(view: NotesView, dataSource: NotesDataSource) {
        self.view = view
        self.dataSource = dataSource
    }
    
    func viewDidLoad() {
        self.dataSource.getNotes { notes in
            DispatchQueue.main.async {
                self.view?.showNotes(notes: notes)
            }
        }
    }
    
    func reloadNotes() {
        self.dataSource.getNotes { notes in
            DispatchQueue.main.async {
                self.view?.showNotes(notes: notes)
            }
        }
    }
    
    func didSelect(note: Note) {
        Navigator.shared.navigateToNoteDetailBy(id: note.id)
    }
    
    func composeNewNote() {
        Navigator.shared.navigateToComposeNewNoteView()
    }
    
    func searchBy(text: String) {
        dataSource.searchBy(text: text) { (notes) in
            DispatchQueue.main.async {
                self.view?.showResult(notes: notes)
            }
        }
    }
}
