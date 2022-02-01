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
        // "割る数","割られる数"が適切かの判定
        let canCaluculate: Bool = judgeCorrectNumber(String1: beDividedTextField.text ?? "", String2: dividedTextField.text ?? "")

        // 割り算の計算・出力
        if canCaluculate {
            if let beDividedFloat = Float(beDividedTextField.text ?? ""), let dividedFloat = Float(dividedTextField.text ?? "") {
                let answerFloat = calculateDivide(num1: beDividedFloat, num2: dividedFloat)
                answerTextLabel.text = String(answerFloat)
            } else {
                return
            }
        }

    }

    private func judgeCorrectNumber(String1: String, String2: String) -> Bool {
        if String1 == "" {
            ouputActionSheet(messageText: "割られる数を入力して下さい")
            return false
        } else if String2 == "" {
            ouputActionSheet(messageText: "割る数を入力して下さい")
            return false
        } else if String2 == "0" {
            ouputActionSheet(messageText: "割る数には0を入力しないで下さい")
            return false
        } else {
            return true
        }
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

    private func calculateDivide(num1:Float, num2:Float) -> Float {
        num1/num2
    }
}

