//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 18.08.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 1. Передать массив с ответами на экран с результатами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты в соотвствии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
    @IBOutlet var labelWithImage: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func filterResult() {
        
        var animalTypes: [AnimalType] = []
        answers.forEach { animalTypes.append($0.type) }
        
        let mappedAnimals = animalTypes.map { ($0, 1) }
        let counts = Dictionary(mappedAnimals, uniquingKeysWith: +)
       
        let maxValue = counts.max { $0.value < $1.value }
        guard let animal = maxValue?.key else { return }
        
        showResult(animal: animal)
       
    }
    
    private func showResult(animal: AnimalType) {
        
        labelWithImage.text = "Вы - \(animal.rawValue)"
        descriptionLabel.text = "\(animal.definition)"
    }
}
