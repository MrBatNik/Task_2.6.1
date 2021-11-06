//
//  ViewController.swift
//  Task_2.6.1
//
//  Created by Никита Бат on 06.11.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setBackgroundColor(red: CGFloat, green: CGFloat, blue: CGFloat)
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.8, green: 1, blue: 0.3, alpha: 1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? SettingsViewController else { return }
        guard let color = view.backgroundColor else { return }
        
        viewController.color = color
        viewController.delegate = self
    }

}

extension ViewController: SettingsViewControllerDelegate {
    
    func setBackgroundColor(red: CGFloat, green: CGFloat, blue: CGFloat) {
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
}
