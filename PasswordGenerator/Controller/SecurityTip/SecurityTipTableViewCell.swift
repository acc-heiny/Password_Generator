//
//  SecurityTipTableViewCell.swift
//  PasswordGenerator
//
//  Created by hellen.heiny.f.santi on 10/01/23.
//

import UIKit

class SecurityTipTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    
   
    func prepare(with tips: SecurityTipModel) {
        titleLabel.text = tips.titulo
        informationLabel.text = tips.texto
    }
    
}
