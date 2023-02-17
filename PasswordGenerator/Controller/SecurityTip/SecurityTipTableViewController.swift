//
//  SecurityTipTableViewController.swift
//  PasswordGenerator
//
//  Created by hellen.heiny.f.santi on 06/01/23.
//

import UIKit

class SecurityTipTableViewController: UITableViewController {
    
    var loadTipsModel: SecurityTipsLoader = SecurityTipsLoader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSecurityTips()
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loadTipsModel.tips.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? SecurityTipTableViewCell else { return UITableViewCell() }
        let securityTip: SecurityTipModel = loadTipsModel.tips[indexPath.row]
        
        cell.prepare(with: securityTip)
        
        return cell
    }
    
    private func loadSecurityTips() {
        loadTipsModel.loadTips()
        
    }
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true)
    }
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
