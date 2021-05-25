//
//  ViewController.swift
//  Task6
//
//  Created by ちいつんしん on 2021/05/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var slider: UISlider!
    @IBOutlet private weak var numberLabel: UILabel!
    private var sliderValue = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        showRandomNumberUnderHundred()
        sliderValue = Int(round(slider.value * 100))
    }

    @IBAction private func changeValue(_ sender: Any) {
        sliderValue = Int(round(slider.value * 100))
        if sliderValue == 0 {
            sliderValue = 1
        }
    }

    @IBAction func didTapJudgeButton(_ sender: Any) {

        let labelNumer = Int(numberLabel.text ?? "") ?? 0
        if labelNumer == sliderValue {
            showResultAler(msg: "あたり")
        } else {
            showResultAler(msg: "はずれ")
        }
    }

    private func showResultAler(msg: String) {
        let alert = UIAlertController(title: "結果", message: "\(msg)\nあなたの値:\(sliderValue)", preferredStyle: .alert)

        let defalutAction = UIAlertAction(title: "再挑戦", style: .default) { _ in
            self.showRandomNumberUnderHundred()
        }
        alert.addAction(defalutAction)

        present(alert, animated: true, completion: nil)

    }

    private func showRandomNumberUnderHundred() {
        numberLabel.text = "\(Int(arc4random_uniform(101)))"
    }
}
