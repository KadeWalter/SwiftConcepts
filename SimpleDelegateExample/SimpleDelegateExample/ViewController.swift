//
//  ViewController.swift
//  SimpleDelegateExample
//
//  Created by Kade Walter on 4/18/22.
//

import UIKit

class ViewController: UIViewController, ColorSelectedDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        initializeViews()
    }
    
    @objc private func showPickColorView() {
        let colorPicker = ColorPickerViewController()
        colorPicker.colorSelectedDelegate = self
        self.navigationController?.pushViewController(colorPicker, animated: true)
    }
    
    func colorSelected(withColor color: UIColor) {
        DispatchQueue.main.async {
            self.view.backgroundColor = color
        }
    }
    
    private func initializeViews() {
        let button = UIButton()
        button.addTarget(self, action: #selector(showPickColorView), for: .touchUpInside)
        button.setTitle("Pick Color", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 44),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }

}

