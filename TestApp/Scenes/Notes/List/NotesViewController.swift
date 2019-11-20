//
//  NotesViewController.swift
//  TestApp
//
//

import UIKit

protocol NotesView: class {
    
    func showNotes(notes: [Note])
    func showResult(notes: [Note])
}

class NotesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NotesView, UISearchBarDelegate {
    
    private var notes: [Note] = []

    // MARK: - Variables

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var presenter: INotesPresenter?

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let note = notes[indexPath.row]
        presenter?.didSelect(note: note)
    }

    func showNotes(notes: [Note]) {
        self.notes = notes
        tableView.reloadData()
    }
    
    @IBAction func newNoteTouchUpInside(_ sender: UIBarButtonItem) {
        presenter?.composeNewNote()
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (!searchText.isEmpty) {
            presenter?.searchBy(text: searchText)
        } else {
            presenter?.reloadNotes()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        presenter?.reloadNotes()
    }
    
    func showResult(notes: [Note]) {
        self.notes = notes
        tableView.reloadData()
    }
    
}

