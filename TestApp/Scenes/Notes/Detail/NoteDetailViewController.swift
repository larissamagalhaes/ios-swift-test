//
//  NoteDetailViewController.swift
//  TestApp
//
//  Created by Larissa on 2019-11-18.
//  Copyright © 2019 AlayaCare. All rights reserved.
//

import UIKit

protocol NoteDetailView: class {
    func noteSaved()
    func enableButton(isEnable: Bool)
    func showNote(text: String)
    func disableButton()
}

class NoteDetailViewController: UIViewController, NoteDetailView, UITextViewDelegate {
    
    var presenter: INoteDetail?
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var saveBarButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        textView.becomeFirstResponder()
    }
    
    func showNote(text: String) {
        textView.text = text
    }
    
    func disableButton() {
        saveBarButtonItem.isEnabled = false
    }
    
    func textViewDidChange(_ textView: UITextView) {
        presenter?.textViewDidChange(text: textView.text)
    }
    
    func enableButton(isEnable: Bool) {
        saveBarButtonItem.isEnabled = isEnable
    }

    @IBAction func doneTouchUpInside(_ sender: UIBarButtonItem) {
        presenter?.didTouchSave(text: textView.text)
    }
    
    func noteSaved() {
        let alert = UIAlertController(title: "Note saved", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            Navigator.shared.navigateToBack()
        }))
        present(alert, animated: true, completion: nil)
    }
}
