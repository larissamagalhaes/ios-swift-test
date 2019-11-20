//
//  Navigator.swift
//  TestApp
//
//  Created by Larissa on 2019-11-18.
//  Copyright © 2019 AlayaCare. All rights reserved.
//

import Foundation
import UIKit

class Assembler {

    func notesViewController() -> NotesViewController {
        let viewController = UIStoryboard(name: "Main" , bundle: nil).instantiateViewController(withIdentifier: "notesViewController") as! NotesViewController
        let dataSource = NotesDataSource.shared
        let presenter = NotesPresenter(view: viewController, dataSource: dataSource)
        viewController.presenter = presenter
        return viewController
    }
}
