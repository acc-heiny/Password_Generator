//
//  ViewController.swift
//  PasswordGenerator
//
//  Created by hellen.heiny.f.santi on 02/01/23.
//

import UIKit


class PasswordGeneratorViewController: UIViewController {
    
    private var passwordListResult: [String] = []
    private var rulesModel: RulesModel = RulesModel()
    private var randomPasswordModel: RandomPasswordGeneratorModel = RandomPasswordGeneratorModel()
    @IBOutlet weak var numberPasswordTextField: UITextField!
    @IBOutlet weak var numberCharacterTextField: UITextField!
    @IBOutlet weak var useNumberSwitch: UISwitch!
    @IBOutlet weak var capitalLetterSwitch: UISwitch!
    @IBOutlet weak var smallLetterSwitch: UISwitch!
    @IBOutlet weak var specialCharactersSwitch: UISwitch!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "generatePassword",
           let viewController: TotalPasswordViewController = segue.destination as? TotalPasswordViewController {
            
            viewController.passwordListResult = passwordListResult
            viewController.delegate = self
        }
    }
    
    @IBAction func generatePasswordButton(_ sender: Any) {
        passwordListResult = verifyRulesAndGeneratePasswords()
    }
    
    private func verifyRulesAndGeneratePasswords() -> [String] {
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
        return verifyAndAddRules(numberOfCharacters: numberOfCharacters, numberOfPasswords: numberOfPasswords)
    }
    
    private func verifyAndAddRules(numberOfCharacters: Int, numberOfPasswords: Int) -> [String] {
        
        if smallLetterSwitch.isOn {
            rulesModel.appliedCharactersSet.append(rulesModel.smallLetters)
        }
        
        if useNumberSwitch.isOn {
            rulesModel.appliedCharactersSet.append(rulesModel.useNumber)
        }
        
        if capitalLetterSwitch.isOn {
            rulesModel.appliedCharactersSet.append(rulesModel.capitalLetters)
        }
        
        if specialCharactersSwitch.isOn {
            rulesModel.appliedCharactersSet.append(rulesModel.specialCharacters)
        }
        
        return randomPasswordModel.generateMultiplePasswords(characters: rulesModel.appliedCharactersSet, numberOfCharacters:numberOfCharacters, numberOfPasswords: numberOfPasswords)
    }
}

extension PasswordGeneratorViewController: TotalPasswordViewControllerDelegate {
    
    func generateAgain() -> [String] {
        return verifyRulesAndGeneratePasswords()
    }
    
}
