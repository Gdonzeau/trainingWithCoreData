//
//  ViewController.swift
//  DatacoreTraining
//
//  Created by Guillaume Donzeau on 04/08/2021.
//

import UIKit

class ViewController: UIViewController {
    var personCoreData = Person(context: AppDelegate.viewContext)
    var personUsable = Data()
    var persons = [Person]()
    var infoView: UIView!
    @IBOutlet weak var dataTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checking()
        // Do any additional setup after loading the view.
    }
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        disMissKeyboardMethod()
    }
    @IBAction func addName(_ sender: UIButton) {
        addNameToData()
    }
    
    @IBAction func saveData(_ sender: UIButton) {
        
    }
    @IBAction func delData(_ sender: UIButton) {
    }
    
    @IBAction func loadData(_ sender: UIButton) {
        loadPersons()
    }
    private func checking() {
        persons = personCoreData.loadPersons()
        print("Il y a \(persons.count) personnes.")
        for object in persons {
            if let name = object.name {
            print(name)
            }
        }
    }
    private func addNameToData() {
        fillingTextView()
        
        //var personName = ""
        if let name = dataTextField.text {
            personUsable.name = name
        }
        addPerson(personUsable: personUsable)
        dataTextField.text = ""
        
    }
    private func fillingTextView() {
        guard let newPerson = dataTextField.text,
              var people = textView.text else {
            return
        }
        people += newPerson + "\n"
        textView.text = people
    }
    private func addPerson(personUsable:Data) { // Création d'un objet CoreData
        
        personCoreData.name = personUsable.name
        personCoreData.savePerson()
        
        /*
        do { // Action qu'on fait
            try AppDelegate.viewContext.save() // On essaie de svg
            
        } catch { // En cas d'erreur, on fait ça
            
        }
        */
    }
    private func loadPersons() {
        //let person = Person(context: AppDelegate.viewContext)
        let result = personCoreData.loadPersons()
        textView.text = ""
        var allPeople = ""
        for personDownloaded in result {
            guard let person = personDownloaded.name else {
                return
            }
            allPeople += person + "\n"
        }
        textView.text = allPeople
    }
    private func disMissKeyboardMethod() {
        dataTextField.resignFirstResponder()
    }

}

extension ViewController: UITextFieldDelegate { // To dismiss keyboard when returnKey
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dataTextField.resignFirstResponder()
        dataTextField.text = ""
        return true
    }
}