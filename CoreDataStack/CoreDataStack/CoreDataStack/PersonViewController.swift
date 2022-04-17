//
//  ViewController.swift
//  CoreDataStack
//
//  Created by Kade Walter on 4/17/22.
//

import UIKit

class PersonViewController: UIViewController {
    
    // Load the core data stack when we are initializing the app.
    var store = CDSStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGroupedBackground
        initializeViews()
    }
    
    @objc private func addPerson() {
        let alert = UIAlertController(title: "Add Person", message: "Add a new person to the data base.", preferredStyle: .alert)
        alert.addTextField() { tf in
            tf.placeholder = "Name"
            tf.tag = 0
        }
        alert.addTextField() { tf in
            tf.placeholder = "Age"
            tf.tag = 1
            tf.sizeToFit()
        }
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let textFields = alert.textFields, let nameTF = textFields.first(where: { $0.tag == 0}), let ageTF = textFields.first(where: { $0.tag == 1}), let name = nameTF.text, let ageText = ageTF.text, let age = Int(ageText) else { return }
            self.savePerson(withName: name, andAge: age)
        }
        alert.addAction(saveAction)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.navigationController?.present(alert, animated: true)
    }
    
    private func savePerson(withName name: String, andAge age: Int) {
        let context = store.persistentContainer.viewContext
        Person.savePerson(withName: name, andAge: age, context: context)
    }
    
    private func initializeViews() {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add Person", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemBlue.cgColor
        
        button.addTarget(self, action: #selector(addPerson), for: .touchUpInside)
        
        self.view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
}
