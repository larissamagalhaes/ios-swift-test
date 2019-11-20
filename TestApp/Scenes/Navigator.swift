//
//  Navigator.swift
//  TestApp
//
//  Created by Larissa on 2019-11-18.
//  Copyright © 2019 AlayaCare. All rights reserved.
//

import Foundation
import UIKit

class Navigator {
    
    static let shared = Navigator()

    private let assembler = Assembler()
    private var navigationController: UINavigationController?
    private var window: UIWindow {
        return UIApplication.shared.keyWindow!
    }
    
    func showInitialViewController() {
        let initialViewController = assembler.notesViewController()
        navigationController = UINavigationController(rootViewController: initialViewController)
        window.rootViewController = navigationController
    }
    
    func navigateToNoteDetailBy(id: String) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "newNoteViewController") as! NoteDetailViewController
        let dataSource = NotesDataSource.shared
        let presenter = NoteDetailPresenter(view: viewController, dataSource: dataSource, id: id)
        viewController.presenter = presenter
        navigationController?.show(viewController, sender: self)
    }
    
    func navigateToComposeNewNoteView() {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "newNoteViewController") as! NoteDetailViewController
        let dataSource = NotesDataSource.shared
        let presenter = NoteDetailPresenter(view: viewController, dataSource: dataSource)
        viewController.presenter = presenter
        navigationController?.show(viewController, sender: self)
    }
    
    func navigateToBack() {
        navigationController?.popViewController(animated: true)
    }
    
}
