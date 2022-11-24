//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 18.08.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var desciptionResultLabel: UILabel!
    
    var answerChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        definesTypeAnimal()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func definesTypeAnimal() {
        
        var recurringAnimals: [AnimalType : Int] = [:]
        let animalTypes = answerChosen.map { $0.type }
        
        for animalType in animalTypes {
            if let count = recurringAnimals[animalType] {
                recurringAnimals.updateValue(count + 1, forKey: animalType)
            } else {
                recurringAnimals[animalType] = 1
            }
        }
        
        let sortedRecurringAnimals = recurringAnimals.sorted {$0.value > $1.value}
        guard let mostRecurringAnimals = sortedRecurringAnimals.first?.key else { return }
        setUI(animal: mostRecurringAnimals)
    }
    
    private func setUI(animal: AnimalType) {
        resultLabel.text = "Вы - \(animal.rawValue)"
        desciptionResultLabel.text = "\(animal.definition)"
    }
    
}
