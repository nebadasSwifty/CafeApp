//
//  BillController.swift
//  Switch
//
//  Created by Кирилл on 13.04.2022.
//

import UIKit

class BillController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var tableNumberLabel: UILabel!
    @IBOutlet weak var parametersLabel: UILabel!
    
    func configureView(name: String, person: String, table: String, reservedTable: String, prepay: String, vipTable: String) {
        DispatchQueue.main.async {
            self.nameLabel.text = "Уважаемый, \(name)"
            self.personLabel.text = "Количество заказанных персон: \(person)"
            self.tableNumberLabel.text = "Ваш номер стола: \(table)"
            self.parametersLabel.text = "Ваши параметры: \(reservedTable) \(prepay) \(vipTable)"
        }
    }
}
