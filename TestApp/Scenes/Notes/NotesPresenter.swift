//
//  NotesPresenter.swift
//  TestApp
//
//

import Foundation

protocol INotesPresenter {

    func viewDidLoad()
    func didSelectIndex(index: Int)
    func composeNewNote()
}

class NotesPresenter: INotesPresenter {
    
    private weak var view: NotesView?
    private let dataSource: NotesDataSource
    
    init(view: NotesView, dataSource: NotesDataSource) {
        self.view = view
        self.dataSource = dataSource
    }
    
    func viewDidLoad() {
        view?.showNotes(notes: NotesDataSource().getNotes())
    }
    
    func didSelectIndex(index: Int) {
        // TODO:
        Navigator.shared.navigateToNoteDetail()
    }
    
    func composeNewNote() {
        Navigator.shared.navigateToComposeNewNoteView()
    }

}
