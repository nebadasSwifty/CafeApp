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
    var reservedTableString = ""
    var prepayString = ""
    var vipTableString = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        self.reservedTableSwitch.addTarget(self, action: #selector(isOnReserv(target:)), for: .valueChanged)
        self.prepaySwitch.addTarget(self, action: #selector(isOnPrepay(target:)), for: .valueChanged)
        self.vipTableSwitch.addTarget(self, action: #selector(isOnVip(target:)), for: .valueChanged)
        
    }
    
    @IBAction func checkButton(_ sender: Any) {
        //Создаем алерт контроллер
        let alert = UIAlertController(title: "Выставить чек?", message: nil, preferredStyle: .alert)
       //Создаем действие подтверждения в алерте
       alert.addAction(UIAlertAction(title: "Да", style: .default){(ok) in
        //проверяем заполненость полей
        if self.nameTextField.text == "" && self.personTextField.text == "" && self.tableNumberField.text == "" {
            let alertText = UIAlertController(title: "Введите все данные", message: nil, preferredStyle: .alert)
            alertText.addAction(UIAlertAction(title: "OK", style: .cancel))
            self.present(alertText, animated: true)
            }
           self.performSegue(withIdentifier: "showCheck", sender: sender)
        })
        //создаем действие отклонения
       alert.addAction(UIAlertAction(title: "Нет", style: .default))
       //выводим алерт
        self.present(alert, animated: true)

    }
    @objc func isOnReserv(target: UISwitch) {
        if target.isOn {
            reservedTableString = "Зарезервировано,"
        } else {
            reservedTableString = "Не зарезервировано"
        }
    }
    @objc func isOnPrepay(target: UISwitch) {
        if target.isOn {
            prepayString = "Депозит,"
        } else {
            prepayString = "Без депозита"
        }
    }
    @objc func isOnVip(target: UISwitch) {
        if target.isOn {
            vipTableString = "VIP стол"
        } else {
            vipTableString = "Общий зал"
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! BillController
        vc.name = nameTextField.text!
        vc.person = personTextField.text!
        vc.table = tableNumberField.text!
        vc.vipTable = vipTableString
        vc.prepay = prepayString
        vc.reservedTable = reservedTableString
        
    }
    
    @objc func dismissKeyboard() {
            view.endEditing(true)
        }
}

