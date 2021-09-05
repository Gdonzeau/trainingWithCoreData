//
//  Person.swift
//  DatacoreTraining
//
//  Created by Guillaume Donzeau on 04/08/2021.
//

import Foundation
import CoreData

class Person: NSManagedObject {
    
    func savePerson() {
        
        do { // Action qu'on fait
            try AppDelegate.viewContext.save() // On essaie de svg
            print("Sauvegardé")
        } catch { // En cas d'erreur, on fait ça
            
        }
    }
    func loadPersons() -> [Person] { //throws -> [Person] {
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        var answer = [Person]()
        do {
            print("Ok")
            let response = try AppDelegate.viewContext.fetch(request) // response = total des données du CoreData
            for index in 0 ..< response.count { // On convertit les réponses du CoreData
                if let nom = response[index].name {
                    print(nom)
                    answer.append(response[index])
                }
            }
            return answer
        } catch {
            //let error = Error()
            //return error
            return [Person]()
        }
    }
    func deleteAll(person: Person) {
        AppDelegate.viewContext.delete(person)
        try? AppDelegate.viewContext.save()
    }
}
