//
//  ViewController.swift
//  PasswordGenerator
//
//  Created by hellen.heiny.f.santi on 02/01/23.
//

import UIKit


class PasswordGeneratorViewController: UIViewController {
    
    private var passwordListResult: [String] = []
    
    @IBOutlet weak var numberPasswordTextField: UITextField!
    @IBOutlet weak var numberCharacterTextField: UITextField!
    @IBOutlet weak var useNumberSwitch: UISwitch!
    @IBOutlet weak var capitalLetterSwitch: UISwitch!
    @IBOutlet weak var smallLetterSwitch: UISwitch!
    @IBOutlet weak var specialCharactersSwitch: UISwitch!
    // prepare for segue: responsavel por passar as informaçoes de uma viewcontroller para outra.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "generatePassword",
           let viewController: TotalPasswordViewController = segue.destination as? TotalPasswordViewController {
            
            viewController.passwordListResult = passwordListResult
            viewController.delegate = self
        }
    }
    
    @IBAction func generatePasswordButton(_ sender: Any) {
        passwordListResult = []
        passwordListResult = verifyRulesAndGeneratePasswords()
    }
    
    private func generateRandomPassword(with length: Int, using characters: String) -> String {
        var passWord: String = String()
        for _ in 0 ..< length {
            if let randomCharacter: Character = characters.randomElement() {
                passWord.append(randomCharacter)
            }
        }
        return passWord
        
    }
    private func verifyRulesAndGeneratePasswords() -> [String] {
        var passwordList: [String] = []
        var characters: String = String()
        var numberOfCharacters: Int = 16
        var numberOfPasswords: Int = 8
        
        if let numberOfCharactersText: String = numberCharacterTextField.text,
           let numberOfCharactersInt: Int = Int(numberOfCharactersText) {
            numberOfCharacters = numberOfCharactersInt
        }
        
        if let numberOfPasswordsText: String = numberPasswordTextField.text,
           let numberOfPasswordsTyped: Int = Int(numberOfPasswordsText) {
            numberOfPasswords = numberOfPasswordsTyped
        }
        
        if smallLetterSwitch.isOn {
            let smallLetters: String = "abcdefghijklmnopqrstuvwxyz"
            characters.append(smallLetters)
        }
        
        if useNumberSwitch.isOn {
            let useNumbers: String = "01234567890123456789"
            characters.append(useNumbers)
        }
        
        if capitalLetterSwitch.isOn {
            let capitalLetters: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
            characters.append(capitalLetters)
        }
        
        if specialCharactersSwitch.isOn {
            let specialCharacters: String = "!@#$%&()!@#$%&()"
            characters.append(specialCharacters)
        }
        
        for _ in 0 ..< numberOfPasswords {
            passwordList.append(generateRandomPassword(with: numberOfCharacters, using: characters))
        }
        return passwordList
    }
    
}

extension PasswordGeneratorViewController: TotalPasswordViewControllerDelegate {

    func generateAgain() -> [String] { 
        return verifyRulesAndGeneratePasswords()
    }
    
}
