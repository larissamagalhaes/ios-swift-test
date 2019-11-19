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
    
    func navigateToNoteDetail() {
        // TODO:
    }
    
    func navigateToComposeNewNoteView() {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "newNoteViewController") as! NewNoteViewController
        navigationController?.show(viewController, sender: self)
    }
    
    func navigateToBack() {
        navigationController?.popViewController(animated: true)
    }
    
}
