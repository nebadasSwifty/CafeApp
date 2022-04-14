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
    var name = ""
    var person = ""
    var table = ""
    var reservedTable = ""
    var prepay = ""
    var vipTable = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        nameLabel.text! += name
        personLabel.text! += person
        tableNumberLabel.text! += table
        parametersLabel.text! += reservedTable + prepay + vipTable
    }
    @objc func dismissKeyboard() {
            view.endEditing(true)
        }
}
