//
//  NewNoteViewController.swift
//  TestApp
//
//  Created by Larissa on 2019-11-18.
//  Copyright © 2019 AlayaCare. All rights reserved.
//

import UIKit

class NewNoteViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func doneTouchUpInside(_ sender: UIBarButtonItem) {
        Navigator.shared.navigateToBack()
    }
}
