//
//  SecurityTipModel.swift
//  PasswordGenerator
//
//  Created by hellen.heiny.f.santi on 10/01/23.
//

import Foundation

struct SecurityTipModel: Codable {
    
    var titulo: String
    var texto: String
    
}

struct SecurityTipsLoader {
    var tips: [SecurityTipModel] = []
    
    mutating func loadTips() {
        guard let fileURL: URL = Bundle.main.url(forResource: "DicasSenha.json", withExtension: nil),
              let jsonData = try? Data(contentsOf: fileURL) else {return}
        
        do {
            tips = try JSONDecoder().decode([SecurityTipModel].self, from: jsonData)
        } catch {
            print(error.localizedDescription)
        }
    }
}
