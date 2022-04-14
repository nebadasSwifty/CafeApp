//
//  SecondViewController.swift
//  Switch
//
//  Created by Кирилл on 13.04.2022.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var personTextField: UITextField!
    @IBOutlet weak var tableNumberField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func showNextScreen() {
    // загрузка Storyboard
    let storyboard = UIStoryboard(name: "BillController", bundle: nil)
    // загрузка View Controller и его сцены со Storyboard
    let viewController = storyboard.instantiateViewController(identifier:
    "BillController")
    // отображение сцены на экране
    self.present(viewController, animated: true, completion: nil)
    }
    
//    @IBAction func checkButton(_ sender: Any) {
//        //Создаем алерт контроллер
//        let alert = UIAlertController(title: "Выставить чек?", message: nil, preferredStyle: .alert)
//        //Создаем действие подтверждения в алерте
//        alert.addAction(UIAlertAction(title: "Да", style: .default)//{(ok) in
////          //проверяем заполненость полей
////            if self.nameTextField.text == "" && self.personTextField.text == "" && self.tableNumberField.text == "" {
////                //если нет надписей выводим алерт
////                let alertText = UIAlertController(title: "Введите все данные", message: nil, preferredStyle: .alert)
////                alertText.addAction(UIAlertAction(title: "OK", style: .cancel))
////                self.present(alertText, animated: true)
////                self.showNextScreen()
////            }
//        )
//        //создаем действие отклонения
//        alert.addAction(UIAlertAction(title: "Нет", style: .cancel))
//        //выводим алерт
//        self.present(alert, animated: true)
        
   // }
    
}
