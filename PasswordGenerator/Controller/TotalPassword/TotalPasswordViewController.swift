//
//  TotalPasswordViewController.swift
//  PasswordGenerator
//
//  Created by hellen.heiny.f.santi on 06/01/23.
//

import UIKit

protocol TotalPasswordViewControllerDelegate: AnyObject {
    func generateAgain() -> [String]
}

class TotalPasswordViewController: UIViewController {
    
    var passwordListResult: [String] = []
    weak var delegate: TotalPasswordViewControllerDelegate?

    @IBOutlet weak var passwordResultTextView: UITextView!
    @IBOutlet weak var passwordTotal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLayout()
    }
    
    private func generateList() -> String {
        var list = String()
        for index in 0...passwordListResult.count-1 {
            list.append("\(index+1) = \(passwordListResult[index])\n")
        }
        return list
    }
   
    private func generateMorePasswords() {
        if let delegate = delegate {
            let newPasswordsGenerate: [String] = delegate.generateAgain()
            passwordListResult.append(contentsOf: newPasswordsGenerate)
        }
    }
    
    private func updateLayout() {
        passwordTotal.text = "Total de senhas: \(passwordListResult.count)"
        passwordResultTextView.text = generateList()
    }
    
    @IBAction func generateAgainButton(_ sender: Any) {
        generateMorePasswords()
        updateLayout()
    }
    
}
