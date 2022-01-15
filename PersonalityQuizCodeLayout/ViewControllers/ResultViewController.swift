//
//  ResultViewController.swift
//  PersonalityQuizCodeLayout
//
//  Created by Igor on 15.01.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    private let resultLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    private let stackView = UIStackView()
    
//    var result: 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Результат"
        
        view.backgroundColor = .systemBackground

        configureLables()
        configureStackView()
    }
    
    private func configureLables() {
        resultLabel.text = "Вы - 🐶"
        resultLabel.font = .systemFont(ofSize: 30)
        resultLabel.textColor = .label
        
        descriptionLabel.text = "Подробное описание"
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.textColor = .label
    }
    
    private func configureStackView() {
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        
        stackView.addArrangedSubview(resultLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        setStackViewConstraitns()
    }
    
    private func setStackViewConstraitns() {
        let safeArea = view.safeAreaLayoutGuide
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            stackView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor)
        ])
    }
}
