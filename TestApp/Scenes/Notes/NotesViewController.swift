//
//  NotesViewController.swift
//  TestApp
//
//

import UIKit

protocol NotesView: class {
    
    func showNotes(notes: [Note])
}

class NotesViewController: UIViewController, UITableViewDataSource, NotesView {
    
    private var notes: [Note] = []

    // MARK: - Variables

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: INotesPresenter?

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! NoteTableViewCell
        
        let note = notes[indexPath.row]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        
        cell.titleLabel.text = note.text
        cell.dateLabel.text = dateFormatter.string(from: note.date)
        
        return cell
    }

    func showNotes(notes: [Note]) {
        self.notes = notes
        tableView.reloadData()
    }
    
    @IBAction func newNoteTouchUpInside(_ sender: UIBarButtonItem) {
        presenter?.composeNewNote()
    }
    
}

