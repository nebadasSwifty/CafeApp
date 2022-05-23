//
//  CafeController.swift
//  Switch
//
//  Created by Кирилл on 13.04.2022.
//

import UIKit

class CafeController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var personTextField: UITextField!
    @IBOutlet weak var tableNumberField: UITextField!
    @IBOutlet weak var reservedTableSwitch: UISwitch!
    @IBOutlet weak var prepaySwitch: UISwitch!
    @IBOutlet weak var vipTableSwitch: UISwitch!
    var reservedTable = ""
    var prepay = ""
    var vipTable = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observingSwitch()
    }
    
    func observingSwitch() {
        self.reservedTableSwitch.addTarget(self, action: #selector(isOnReserv(target:)), for: .valueChanged)
        self.prepaySwitch.addTarget(self, action: #selector(isOnPrepay(target:)), for: .valueChanged)
        self.vipTableSwitch.addTarget(self, action: #selector(isOnVip(target:)), for: .valueChanged)
    }
    
    @IBAction func checkButton(_ sender: UIButton) {
        //Создаем алерт контроллер
        guard self.nameTextField.text != "", self.personTextField.text != "", self.tableNumberField.text != "" else { return self.presentAlert(withText: "Введите все данные")}
        performSegue(withIdentifier: "showCheck", sender: self)
    }
    
    @objc func isOnReserv(target: UISwitch) {
        if target.isOn {
            reservedTable = "Зарезервировано"
        } else {
            reservedTable = "Не зарезервировано"
        }
    }
    
    @objc func isOnPrepay(target: UISwitch) {
        if target.isOn {
            prepay = "Депозит"
        } else {
            prepay = "Без депозита"
        }
    }
    
    @objc func isOnVip(target: UISwitch) {
        if target.isOn {
            vipTable = "VIP стол"
        } else {
            vipTable = "Общий зал"
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? BillController else { return }
        guard let name = nameTextField.text,
              let person = personTextField.text,
              let table = tableNumberField.text else { return }
        vc.configureView(name: name, person: person, table: table, reservedTable: reservedTable, prepay: prepay, vipTable: vipTable)
    }
    
    
}

