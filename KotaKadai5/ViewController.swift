//
//  ViewController.swift
//  KotaKadai5
//
//  Created by 前田航汰 on 2022/02/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var beDividedTextField: UITextField!
    @IBOutlet weak private var dividedTextField: UITextField!
    @IBOutlet weak private var answerTextLabel: UILabel!

    @IBAction private func didTapCalculationButton(_ sender: Any) {
        guard let beDivided = Float(beDividedTextField.text ?? "") else {
            ouputActionSheet(messageText: "割られる数を入力して下さい")
            return
        }

        guard let divided = Float(dividedTextField.text ?? "") else {
            ouputActionSheet(messageText: "割る数を入力して下さい")
            return
        }

        guard divided != 0 else {
            ouputActionSheet(messageText: "割る数には0を入力しないで下さい")
            return
        }

        // 割り算の計算・出力
        answerTextLabel.text = String(beDivided / divided)
    }

    private func ouputActionSheet(messageText: String) {
        let alert = UIAlertController(
            title: "課題5",
            message: messageText,
            preferredStyle: .alert)

        let ok = UIAlertAction(
            title: "OK",
            style: .default)
            alert.addAction(ok)

        present(alert, animated: true, completion: nil)
    }
}
