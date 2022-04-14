//
//  ViewController.swift
//  Switch
//
//  Created by Кирилл on 13.04.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        //делаем текст в поле пароля невидимым
        self.passwordField.isSecureTextEntry = true
    }
    //функция для появления текста пароля
    @IBAction func visiblePassword(_ sender: UIButton) {
        passwordField.isSecureTextEntry.toggle()
        //проверям скрыт ли текст или нет
        if passwordField.isSecureTextEntry {
            //заполняем кнопку иконкой
            if let image = UIImage(systemName: "eye.fill") {
                sender.setImage(image, for: .normal)
            }
        } else {
            //если не скрыт то меняем иконку
            if let image = UIImage(systemName: "eye.slash.fill") {
                sender.setImage(image, for: .normal)
            }
        }
    }
    @IBAction func buttonNext(_ sender: Any) {
        let cafe = CafeController()
        // проверка всех полей на заполненность
        if emailTextField.text!.isEmpty || passwordField.text!.isEmpty {
            let alert = UIAlertController(title: "Введите данные и пароль", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
            self.present(cafe, animated: true)
        }
    }
    @objc func dismissKeyboard() {
            view.endEditing(true)
        }
}

