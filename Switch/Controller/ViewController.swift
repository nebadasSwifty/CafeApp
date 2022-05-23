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
        hideKeyboard()
    }
    //функция для появления текста пароля
    @IBAction func visiblePassword(_ sender: UIButton) {
        configureHidePasswordButton(sender: sender)
    }
    
    private func configureHidePasswordButton(sender: UIButton) {
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
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let cafeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "cafeVC") as? CafeController else { return }
        guard emailTextField.text != "" || passwordField.text != "" else { return presentAlert(withText: "Введите данные!") }
        navigationController?.pushViewController(cafeVC, animated: true)
    }
}

