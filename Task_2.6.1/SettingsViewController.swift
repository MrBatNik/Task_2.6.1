//
//  ChangeColorViewController.swift
//  Task_2.6.1
//
//  Created by Никита Бат on 06.11.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    @IBOutlet var doneButton: UIButton!
    
    var color = UIColor()
    var delegate: SettingsViewControllerDelegate!
    
    private let toolBar = UIToolbar()
    private let keyboardDoneButton = UIBarButtonItem(title: "Done",
                                                     style: .plain,
                                                     target: self,
                                                     action: #selector(didEndEditing))
    private let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                                target: nil,
                                                action: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()

    }
    
    @IBAction func slidersAction() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        
        redTextField.text = String(format: "%.2f", redSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        blueTextField.text = String(format: "%.2f", blueSlider.value)
    }
    
    @IBAction func toggleDoneButton() {
        delegate.setBackgroundColor(red: CGFloat(redSlider.value),
                                    green: CGFloat(greenSlider.value),
                                    blue: CGFloat(blueSlider.value))
        
        view.endEditing(true)
        dismiss(animated: true)
    }
    
    
    @objc func didEndEditing() {
        view.endEditing(true)
    }

}

extension SettingsViewController {
    
    private func setupSubviews() {
        colorView.layer.cornerRadius = 20
        
        toolBar.items = [flexibleSpace, keyboardDoneButton]
        toolBar.sizeToFit()
        redTextField.inputAccessoryView = toolBar
        greenTextField.inputAccessoryView = toolBar
        blueTextField.inputAccessoryView = toolBar
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        redSlider.value = Float(color.rgba.red)
        greenSlider.value = Float(color.rgba.green)
        blueSlider.value = Float(color.rgba.blue)
        
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        
        redTextField.text = String(format: "%.2f", redSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        blueTextField.text = String(format: "%.2f", blueSlider.value)
        redTextField.keyboardType = .decimalPad
        greenTextField.keyboardType = .decimalPad
        blueTextField.keyboardType = .decimalPad
        
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
}

extension SettingsViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
            case redTextField:
                guard let text = redTextField.text, let number = Float(text) else { return }
                redLabel.text = String(format: "%.2f", number)
                redSlider.value = number
            case greenTextField:
                guard let text = greenTextField.text, let number = Float(text) else { return }
                greenLabel.text = String(format: "%.2f", number)
                greenSlider.value = number
            case blueTextField:
                guard let text = blueTextField.text, let number = Float(text) else { return }
                blueLabel.text = String(format: "%.2f", number)
                blueSlider.value = number
            default:
                break
        }
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
}

extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red, green, blue, alpha)
    }
}
