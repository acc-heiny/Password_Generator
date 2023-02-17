//
//  GeneratePasswordModel.swift
//  PasswordGenerator
//
//  Created by hellen.heiny.f.santi on 13/02/23.
//

import Foundation

struct RulesModel {
    
    var appliedCharactersSet: String = String()
    let specialCharacters: String = "!@#$%&()!@#$%&()"
    let capitalLetters: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let useNumber: String = "01234567890123456789"
    let smallLetters: String = "abcdefghijklmnopqrstuvwxyz"
    
}

struct RandomPasswordGeneratorModel {
    
    private func generatePassword(with length: Int, using characters: String) -> String {
        
        var passWord: String = String()
        for _ in 0 ..< length {
            if let randomCharacter: Character = characters.randomElement() {
                passWord.append(randomCharacter)
            }
        }
        return passWord
        
    }
    
    func generateMultiplePasswords( characters: String, numberOfCharacters: Int, numberOfPasswords: Int) -> [String] {
        
        var passwordList: [String] = []
        for _ in 0 ..< numberOfPasswords {
            passwordList.append(generatePassword(with: numberOfCharacters, using: characters))
            
        }
        
        return passwordList
    }
}
